import json
import requests,time
import sys
from optparse import OptionParser
start_time = time.time()
OK = 0
WARNING = 1
CRITICAL = 2


response = requests.request("GET", "http://172.16.4.54:7779/")
r=response.status_code
#a=response.text
#print(a['benefit']['data'])
if r != 200:
        print ('is dead')
        sys.exit(WARNING)
if r == 200:
        print('web live')
        sys.exit(WARNING)
