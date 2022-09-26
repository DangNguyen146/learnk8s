#!/bin/bash
WARN_THRESHOLD=10000	# default warning:  80% of file limit used
CRITICAL_THRESHOLD=100000	# default critical: 90% of file limit used

WARN_PROCESS=1000
CRITICAL_PROCESS=1500

CHECK_LSOF=0
COUT_ALL_THRESHOLD=0

now=$(date +"%T")
echo "Start in time $now" > /usr/lib64/nagios/plugins/lsof.log
for i in $(ps aux | awk 'NR>1 {print $2}')
do
    result_open=`sudo ls -l /proc/${i}/fd 2>/dev/null`
    result=$?
    if [[ $result -eq 0  ]]; then
        count_openfile=`echo "$result_open" | wc -l`
        COUT_ALL_THRESHOLD=$(( COUT_ALL_THRESHOLD + ${count_openfile} ))
        if [ "$count_openfile" -gt "$WARN_PROCESS" ]; then
            if [ "$count_openfile" -gt "$CRITICAL_PROCESS" ]; then   
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=2
            else
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=1
            fi
        fi
    fi
done

echo "Total PID open file is: $COUT_ALL_THRESHOLD" >> /usr/lib64/nagios/plugins/lsof.log
if [ "$COUT_ALL_THRESHOLD" -gt "$WARN_THRESHOLD" ]; then
    if [ "$COUT_ALL_THRESHOLD" -gt "$CRITICAL_THRESHOLD" ]; then
        CHECK_LSOF=2
    fi
    CHECK_LSOF=1
fi
echo $CHECK_LSOF >> /usr/lib64/nagios/plugins/lsof.log
exit $CHECK_LSOF