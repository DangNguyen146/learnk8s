#!/bin/bash
result_open=`cat /usr/lib64/nagios/plugins/aaa.log`
result=$?
EXIT_CODE_RESULT=0
if [[ $result -eq 0  ]]; then
    ALL_LINE=`cat /usr/lib64/nagios/plugins/aaa.log | wc -l`
    cat /usr/lib64/nagios/plugins/aaa.log | head -n $(( ALL_LINE - 1 ))
    EXIT_CODE_RESULT=`cat /usr/lib64/nagios/plugins/aaa.log | tail -n 1`
    exit $EXIT_CODE_RESULT
fi
echo "no result"
exit $EXIT_CODE_RESULT