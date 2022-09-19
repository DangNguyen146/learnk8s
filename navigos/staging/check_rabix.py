#!/usr/bin/python3.6
import json
# import requests,time
import sys
import redis
import datetime
from optparse import OptionParser
import pytz
OK = 0
WARNING = 1
CRITICAL = 2
host = sys.argv[1]
port = int(sys.argv[2])
service = sys.argv[3]
db =  int(sys.argv[4])
test_key= sys.argv[5]
# host = "localhost"
# port = 6379
# service ="service"
# db = 1
# test_key= "test_key_check"
def main():
    now = datetime.datetime.now()
    my_host = "%s:%d" % (host, port)
    try:
        try:
            redis_client = redis.StrictRedis(host=host,
                                        port=port,
                                        db=db)
        except Exception as er:
            # print(er)
            sys.exit(CRITICAL)
        data = redis_client.get(test_key)
        try:
            redis_client.connection_pool.disconnect()
        except Exception as er:
            pass  
        if data!= None:
            data = data.decode("utf-8")
        if "status" in test_key:
            if data!= None:
                if data == "0" or data == "23":
                    print (data)
                    sys.exit(OK)
                else:
                    print (data)
                    sys.exit(WARNING)
            print ("unknown")
            redis_client.close
            sys.exit(3)
      
        time_response=0
        if test_key=="lsyncd_vnworks_images_lastsync":
            time_response = (now-datetime.datetime.strptime((data), '%b %d %H:%M:%S %Y')).total_seconds()
        else:
            now = datetime.datetime.utcnow()
            time_response=int(now.strftime("%s"))-int(datetime.datetime.utcfromtimestamp(int(data)).replace(tzinfo=datetime.timezone.utc).strftime("%s"))
        print ('redis %s is alive!!! | time_response=%ss;1.000000;2.000000;0.000000;10.000000' %(my_host,str(time_response)))
        sys.exit(OK)
    except Exception as e:
        print("connect redis %s error %s" % (my_host, e))
        sys.exit(CRITICAL)
main()