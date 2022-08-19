#!/bin/bash
# service ="job-golang-backend"
# host= "172.16.4.162:30265,172.16.4.162:30269"
SERVICE=$1
HOST_NAME=$2
HOST=$3
echo "-----------------------------"
OK=0
WARNING=1
CRITICAL=2

URL=""
HEALTH=""

if [ "$SERVICE" = "onboarding" ]; then
        URL="/status"
fi
if [ "$SERVICE" = "predictionio" ]; then
        URL="/v3/jobs?isTopJobEmail=1&jobId=1&limit=20&useProfileInfo=1&user=1"
fi
if [ "$SERVICE" = "superadmin" ]; then
        URL="/status"
fi
if [ "$SERVICE" = "vietnamworks" ]; then
        URL="/tim-viec-lam"
fi
echo $URL
target_status=""
arrIN=(${HOST//,/ })
for i in "${arrIN[@]}"; do
        arrHOST=(${i//:/ })
        health=""
        code=$(curl --connect-timeout 2 -m 2 -s -o /dev/null --resolve $HOST_NAME:${arrHOST[1]}:${arrHOST[0]} -w "%{http_code}"  http://$HOST_NAME:${arrHOST[1]}/$URL)
        time_respone=$(curl --connect-timeout 2 -m 2 -s -o /dev/null --resolve $HOST_NAME:${arrHOST[1]}:${arrHOST[0]} -s -w '%{time_total}\n'  http://$HOST_NAME:${arrHOST[1]}/$URL)
        if [[ "$code" = 200 ||  "$code" = 401 ||  "$code" = 404 ||  "$code" = 301 ||  "$code" = 302 ]]; then
                health=""
        else
                health="UNHEALTHY"
        fi
        echo $code
        if [ "$health" != "" ]; then
                if [ "$target_status" = "" ]; then
                        target_status="$i: $health"
                else
                        target_status="$target_status, $i: $health"
                fi
        fi
done


if [ "$health" = "" ]; then
        echo "$SERVICE is alive!!! | time_response=$time_respone;1.000000;2.000000;0.000000;10.000000"
        exit 0
else
        echo "$HOST_NAME ----- $SERVICE is UNHEALTHY: $target_status"
        exit 1
fi