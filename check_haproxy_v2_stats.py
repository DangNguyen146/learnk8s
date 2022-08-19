#!/bin/python3.6
import json
from datetime import datetime
import requests
import redis
import sys
from elasticsearch import Elasticsearch
from elasticsearch import helpers
import uuid

# pip install elasticsearch==7.17.4


OK = 0
WARNING = 0
CRITICAL = 0


# host ="172.16.5.93:9000"
# service_name ="ha01"
# warning_conn=2
# critical_conn=5


host = sys.argv[1]
service_name = sys.argv[2]
warning_conn = int(sys.argv[3])
critical_conn = int(sys.argv[4])



url= "http://%s/haproxy_stats;csv;norefresh" % host
auth=('admin', '82DULqFqvNqc')

sevices_stats=["session-memcache","api-memcache","employer-memcache","smtp-gateway-tcp","rabbitmq-core","redis-employer","kafka","lbdb","redis-cache","redis-online","redis-mail","redis-jobalert","redis-sso"]


def _decode(value):
    """
    decode byte strings and convert to int where needed
    """
    if value.isdigit():
        return int(value)
    if isinstance(value, bytes):
        return value.decode('utf-8')
    else:
        return value

def main():


    frontend_status = ""
    backend_status = ""
    stats = ""
    try:
        client = redis.StrictRedis(host='0.0.0.0',
                                    port=6379,
                                    db=9)
        # r = requests.get('http://10.122.4.205:9000/haproxy_stats;csv;norefresh', auth=('admin', '82DULqFqvNqc'))
        # r = requests.get('http://10.122.4.206:9000/haproxy_stats;csv;norefresh', auth=('admin', '82DULqFqvNqc'))

        r = requests.get(url, auth=auth)
        # print(r.text)
        csv = [l for l in r.text.strip(' #').split('\n') if l]
        fields = [ f for f in csv.pop(0).split(',') if f ]

        total_conn = 0


        data = {}
        frontend_row = None
        time = datetime.utcnow().isoformat()
        batch_data =[]
        for line in csv:
            # print(line)
            values = line.split(',')
            values = [_decode(v) for v in values]

            # zip field names and values
            row = dict(zip(fields, values))
            if row["pxname"] !="admin_page":
                if row["svname"] =="FRONTEND" or row["svname"] =="BACKEND":
                    # print (row["pxname"], row["stot"])
                    if row["stot"]!="":
                        print(row)

                        if row["svname"] =="FRONTEND":
                            total_conn += row["scur"]
                            
                            if row["pxname"] in sevices_stats:
                                stats += " %s=%d;;;" % (row["pxname"], row["scur"])
                            if row["status"]!="OPEN":
                                frontend_status += " ," + row["pxname"]

                            frontend_row = row
                        if row["svname"] =="BACKEND":
                            if row["status"]!="UP":
                                backend_status += " ," + row["pxname"]

                            if frontend_row["pxname"] == row["pxname"]:
                                myrow = {
                                    "@timestamp": time,
                                    "fpxname": frontend_row["pxname"],
                                    "fsvname": frontend_row["svname"],
                                    "fscur": frontend_row["scur"],
                                    "fsmax": frontend_row["smax"],
                                    "fslim": frontend_row["slim"],
                                    "fstatus": frontend_row["status"],
                                    "frate": frontend_row["rate"],
                                    "bsvname": row["svname"],
                                    "bscur": row["scur"],
                                    "bsmax": row["smax"],
                                    "bslim": row["slim"],
                                    "bstatus": row["status"],
                                    "brate": row["rate"],
                                    "bqcur": row["qcur"],
                                    "bwretr": row["wretr"],
                                    "becon": row["econ"],


                                }
                                name= frontend_row["pxname"]
                                # print(name)
                                data[name]=myrow
                                batch_data.append(myrow)



    except Exception as e:
        # print(e)
        print('HAproxy, fetch haproxy stats fail !!!')
        sys.exit(CRITICAL)

    print(data)
    try:
        data_json = json.dumps(data)
        key= "haproxy_stats_%s" % service_name
        try:
            client.set(key, data_json)
        except Exception as e:
            print(e)
        client.set(key, data_json)

        # result = client.get('test_json').decode()
        # # print(result)
        # y = json.loads(result)
        # print(y["redis-sso"])

        data =[]
        now = datetime.now()  # current date and time
        index="haproxy-%s" % now.strftime("%Y.%m.%d")
        for row in batch_data:
            id = str(uuid.uuid1())
            record= {
                "_index": index,
                "_type": "_doc",
                "_id": id,
                "_source":row
            }
            data.append(record)

        # print(data)

        try:

            es = Elasticsearch("%s://%s:%s" % ("http", "172.16.4.45", 9200),
                               http_auth=("td-agent", "aJtK29az9mzTSMi"), use_ssl=False,
                               verify_certs=False, timeout=5000)
            res = helpers.bulk(es, data)
        except Exception as e:
            pass



        if frontend_status!="":
            # print("frontend_status: '%s'" % frontend_status)
            print('HAproxy These frontend critical: %s !!! | total_conn=%d;;; %s' % (frontend_status,total_conn,stats))
            sys.exit(CRITICAL)

        if backend_status!="":
            # print("backend_status: '%s'" % backend_status)
            print('HAproxy These backend critical: %s !!! | total_conn=%d;;; %s' % (backend_status,total_conn,stats))
            sys.exit(CRITICAL)

        if total_conn>= critical_conn:
            print('HAproxy Total connection is critical: %d !!! | total_conn=%d;;; %s' % (total_conn,total_conn,stats))
            sys.exit(CRITICAL)

        if total_conn>= warning_conn:
            print('HAproxy Total connection is warning: %d !!! | total_conn=%d;;; %s' % (total_conn,total_conn,stats))
            sys.exit(CRITICAL)

        print('HAproxy is OK!!! | total_conn=%d;;; %s' % (total_conn,stats))
        sys.exit(OK)

    except Exception as e:
        print('HAproxy, stored redis fai!!! | total_conn=%d;;; %s' % (total_conn,stats))
        sys.exit(WARNING)

if __name__ == '__main__':
    main()