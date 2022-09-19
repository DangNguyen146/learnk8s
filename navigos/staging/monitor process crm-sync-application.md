### monitor process crm-sync-application
Check command running in employer container

 

staging: 172.16.4.182

release:

 

 

Command run:

        for i in `sudo docker ps -a  | grep 'vnw/php' | grep 'employer'  | grep 'Up ' | awk '{print $1}'`
        do
            sudo docker exec -i $i /bin/bash -c "cd $DIR_DATA;/usr/local/bin/php /data/www/employer/bin/console naviworks:candidate-bundle:command:crm-sync-application"
        done
 
 

Check

        [root@vStaging-Rancher02 ~]# ps aux | grep "/usr/local/bin/php /data/www/employer/bin/console naviworks:candidate-bundle:command:crm-sync-application" | grep -v "grep"
        root 26514 0.3 1.0 1198732 85240 pts/0 Sl+ 10:35 0:02 /usr/local/bin/php /data/www/employer/bin/console naviworks:candidate-bundle:command:crm-sync-application
 