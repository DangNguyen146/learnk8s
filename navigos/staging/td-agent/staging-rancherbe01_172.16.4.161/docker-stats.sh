delay=$(( $RANDOM % 300 + 1 ))
echo "delay: $delay"
sleep $delay

idl=`/usr/bin/vmstat | sed -e 1,2d | awk '{print $15}'`
cpu=$(( 100 - idl ))

FreeM=`free -m`
memTotal_m=`echo "$FreeM" |grep Mem |awk '{print $2}'`
memUsed_m=`echo "$FreeM" |grep Mem |awk '{print $3}'`
memFree_m=`echo "$FreeM" |grep Mem |awk '{print $4}'`
memBuffer_cache_m=`echo "$FreeM" |grep Mem |awk '{print $6}'`
memAvailable_m=`echo "$FreeM" |grep Mem |awk '{print $7}'`
memUsed_m=$(($memTotal_m-$memFree_m-$memBuffer_cache_m))
memUsedPrc=`echo $((($memUsed_m*100)/$memTotal_m))||cut -d. -f1`
echo "{\"cpu_usage\":$cpu,\"memUsedPrc\":$memUsedPrc,\"type\":\"vm\"}"  >> logs/docker.log

sudo /usr/bin/docker stats --no-stream --format \
   "{\"Name\":\"{{ .Name }}\",\"NetIO\":\"{{ .NetIO }}\",\"BlockIO\":\"{{ .BlockIO }}\",\"ID\":\"{{ .ID }}\",\"MemUsage\":\"{{ .MemUsage }}\",\"MemPerc\":\"{{ .MemPerc }}\",\"CPUPerc\":\"{{ .CPUPerc }}\"}" | grep -v "POD\|calico\|cattle\|canal\|ingress" | grep "k8s_"  | sed -e 's:\...%::g'  >> logs/docker.log

minutetring=`date +%M`
minutetring=`echo $minutetring  |  sed 's/^0*//'`
minute=$((minutetring))
if [ $minute -lt 6 ]; then
    /usr/sbin/logrotate /data/www/container_stats/docker_stats_rotate.conf >/dev/null 2>&1
fi