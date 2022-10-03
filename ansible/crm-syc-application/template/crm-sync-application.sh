#!/bin/sh
status=`ps aux | grep "/usr/local/bin/php /data/www/employer/bin/console naviworks:candidate-bundle:command:crm-sync-application" | grep -v "grep" >/dev/null`
result=$?
if [[ $result -eq 0  ]]; then
       echo "$status status = 1|status=1;;;;"
       exit 0
else
        echo "service is not active status = 0 %|status=0;;;;"
        exit 2
fi