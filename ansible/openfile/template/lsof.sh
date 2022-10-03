#!/bin/bash

WARN_THRESHOLD=10000	# default warning:  80% of file limit used
CRITICAL_THRESHOLD=100000	# default critical: 90% of file limit used

global_max=$(cat /proc/sys/fs/file-nr 2>&1 |cut -f 3)
global_cur=$(cat /proc/sys/fs/file-nr 2>&1 |cut -f 1)
curl_ratio=`echo "scale=3;$global_cur*100/$global_max"|bc`

echo "Ratio PID open file is: $curl_ratio%, Total PID open file is: $global_cur | all_ratio_threshold=$curl_ratio;10;15;; all_threshold=$global_cur;$WARN_THRESHOLD;$CRITICAL_THRESHOLD;;";

if [ "$global_cur" -gt "$WARN_THRESHOLD" ]; then
    if [ "$global_cur" -gt "$CRITICAL_THRESHOLD" ]; then
        exit 2
    fi
    exit 1
fi
exit 0