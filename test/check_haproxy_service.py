#!/bin/python3.6
import json
from datetime import datetime
import requests
import redis
import sys

OK = 0
WARNING = 0
CRITICAL = 0


# HA_name ="ha01"
# service ="redis-sso"
# frontend_warning_conn=2
# frontend_critical_conn=5
# backend_warning_conn=1
# backend_critical_conn=3
# low_warning_conn=2
# low_critical_conn=-3

HA_name = sys.argv[1]
service =sys.argv[2]
frontend_warning_conn= int(sys.argv[3].split(",")[0])
frontend_critical_conn= int(sys.argv[3].split(",")[1])
backend_warning_conn= int(sys.argv[4].split(",")[0])
backend_critical_conn= int(sys.argv[4].split(",")[1])
low_warning_conn= int(sys.argv[5].split(",")[0])
low_critical_conn= int(sys.argv[5].split(",")[1])

def main():
    try:
        now = datetime.now()
        client = redis.StrictRedis(host='localhost',
                                    port=6379,
                                    db=9)
        key= "haproxy_stats_%s" % HA_name
        result = client.get(key).decode()
        y = json.loads(result)
        # print(y[service])
        try:
            record = y[service]
            # print(record)
        except Exception as e:
            print (e)
        record = y[service]

        stats = "fscur=%d;;; fsmax=%d;;; fslim=%d;;; frate=%d;;; bscur=%d;;; bsmax=%d;;; bslim=%d;;; brate=%d;;; bqcur=%d;;; bwretr=%d;;; becon=%d" % (record["fscur"], record["fsmax"], record["fslim"], record["frate"], record["bscur"], record["bsmax"], record["bslim"], record["brate"], record["bqcur"], record["bwretr"], record["becon"])

        if record["fstatus"] != "OPEN":
            print('The frontend of service %s is critical !!! | %s' % (service, stats))
            sys.exit(CRITICAL)

        if record["bstatus"] != "UP":
            print('The backend of service %s is critical !!! | %s' % (service, stats))
            sys.exit(CRITICAL)

        if frontend_critical_conn <= record["fscur"]:
            print('The current connection of frontend service %s is critical. %d/%d !!! | %s' % (service, record["fscur"], frontend_critical_conn, stats))
            sys.exit(CRITICAL)

        if backend_critical_conn <= record["bscur"]:
            print('The current connection of backend service %s is critical. %d/%d !!! | %s' % (service, record["bscur"],backend_critical_conn, stats))
            sys.exit(CRITICAL)


        if frontend_warning_conn <= record["fscur"]:
            print('The current connection of frontend service %s is warning. %d/%d !!! | %s' % (service, record["fscur"],frontend_warning_conn, stats))
            sys.exit(WARNING)


        if backend_warning_conn <= record["bscur"]:
            print('The current connection of backend service %s is warning. %d/%d !!! | %s' % (service, record["bscur"], backend_warning_conn, stats))
            sys.exit(WARNING)

        rate_conn_front= int((record["fscur"] * 100) / record["fslim"])
        rate_conn_back=  int ((record["bscur"] * 100) / record["bslim"])

        if rate_conn_front >= 90:
            print('The current connection of frontend service %s is reaching the limit connection. %d/%d !!! | %s' % (service, record["fscur"],record["fslim"], stats))
            sys.exit(CRITICAL)

        if rate_conn_back >= 90:
            print('The current connection of backend service %s is reaching the limit connection. %d/%d !!! | %s' % (service, record["bscur"],record["bslim"], stats))
            sys.exit(CRITICAL)

        if rate_conn_front >= 80:
            print('The current connection of frontend service %s is reaching the limit connection. %d/%d !!! | %s' % (service, record["fscur"],record["fslim"], stats))
            sys.exit(WARNING)

        if rate_conn_back >= 80:
            print('The current connection of backend service %s is reaching the limit connection. %d/%d !!! | %s' % (service, record["bscur"],record["bslim"], stats))
            sys.exit(WARNING)

        if now.hour >= 7 and now.hour < 22:
            if low_critical_conn >= record["fscur"]:
                print('The current connection of service %s is low critical . %d/%d !!! | %s' % (
                service, record["fscur"], low_critical_conn, stats))
                sys.exit(CRITICAL)

            if low_warning_conn >= record["fscur"]:
                print('The current connection of service %s is low warning . %d/%d !!! | %s' % (
                service, record["fscur"], low_warning_conn, stats))
                sys.exit(WARNING)

        print('The service %s is OK !!! | %s' % (
        service, stats))
        sys.exit(OK)

    except Exception as e:
        print (e)
        print('HAproxy get data fai!!!')
        sys.exit(WARNING)

if __name__ == '__main__':
    main()