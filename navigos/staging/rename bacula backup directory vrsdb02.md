from: vrsdb02
to: microdb

[backup_full_microdb]
https://jenkins-cron.vietnamworks.com/job/Production/job/Backups/job/backup_full_microdb/

DIR='/data/docker/volumes/ip2location/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'ip2location' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;rm -rf *.gz"
dwhdb > $DIR_DATA/backup_full_dwhdb_$TIME.sql"
ip2location > $DIR_DATA/backup_full_ip2location_$TIME.sql"
smart_interview > $DIR_DATA/backup_full_smart_interview_$TIME.sql"
vnw_api_oauth > $DIR_DATA/backup_full_vnw_api_oauth_$TIME.sql"
vnworks_sims > $DIR_DATA/backup_full_vnworks_sims_$TIME.sql"


sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo /bin/scp $DIR/*  root@172.16.1.74:/online_backup/vrsdb02/mysql_backup/full/



[mysql_backup_msdb_msdb02]
https://jenkins-cron.vietnamworks.com/job/Production/job/Backups/job/mysql_backup_msdb_msdb02/

# 10.122.3.42
DIR='/data/docker/volumes/dbclick/navigos-backup/mysql_backup'
DIR_DATA='/var/lib/mysql/navigos-backup/mysql_backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'mysql' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;rm -rf *.gz"


 sudo docker exec -i $DOCKERID /bin/bash -c '/usr/bin/mysql -udatateam -ps4OwFgfGYqf6elTFOWoi -e "show master status\G;"'> /home/ngosadm/slaveinfo_$TIME.log

sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -ps4OwFgfGYqf6elTFOWoi --databases vnw_click > $DIR_DATA/backup_full_vnw_click_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -ps4OwFgfGYqf6elTFOWoi --databases navi_cms > $DIR_DATA/backup_full_navi_cms_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -ps4OwFgfGYqf6elTFOWoi --databases hr_onboard > $DIR_DATA/backup_full_hr_onboard_$TIME.sql"
sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"

# 172.16.1.74
sudo rsync -azvuhu '-e ssh -p 7770'  root@10.122.3.42:/data/docker/volumes/dbclick/navigos-backup/mysql_backup/backup_full_*`date +%Y%m%d`.sql.gz /online_backup/vrsdb02/mysql_backup/full/

/bin/find /online_backup/vrsdb02/mysql_backup/full/  -ctime +45  -exec rm -rf {} \;



[cron_clean_bacula_backup_data]
https://jenkins-cron.vietnamworks.com/job/Production/job/Schedules/job/system/job/cron_clean_bacula_backup_data/

"postgres_bannerbooking_production*.gz" 60
"backup_full_vnw_api_oauth*.gz" 60
"backup_full_hr_onboard*.gz" 60
"backup_full_smart_interview*.gz" 60
"backup_full_vnw_click*.gz" 60
"backup_full_navi_cms*.gz" 60
"backup_full_vnworks_sims*.gz" 60
"backup_full_ip2location*.gz" 60
"backup_full_dwhdb*.gz" 60
clean_log_folder "/online_backup/mongo_smartnavi/backup_full" "mongodump*" 90
clean_log_folder "/online_backup/mongo_smartnavi/backup_incremental" "*" 90

# bakula_disk_plan_clean_log
clean_log "/online_backup/vreleasedb02/mysql_backup/daily" "mysql-bin.*" 60
clean_log "/online_backup/vreleasedb02/mysql_backup/weekly" "backup_full_database_*" 60
clean_log "/online_backup/vstagingdb02/mysql_backup/daily" "mysql-bin.*" 60
clean_log "/online_backup/vstagingdb02/mysql_backup/weekly" "backup_full_database_*" 60

# /online_backup/staging-jenskins



[Sync_Data_vnw_click]
https://release-jenkins.vietnamworks.com/job/Releases/job/Schedules/job/Sync%20Data%20vnw_click/

DOCKERID='f3be90728497'
# 2 week 1 run
number_week=`/bin/date +%W`
if expr $number_week % 2
then
    echo "not running!!!"
    #exit 0
else
    echo "running!!!"
fi
/bin/echo "clean file backup"
sudo docker exec -t $DOCKERID /bin/bash -c "rm -rf /data/backup/*"
BACKUP_NAME=`/bin/date +"backup_full_vnw_click_%Y%m%d.sql.gz" -d "last saturday"`
BACKUP_DIR="/online_backup/vrsdb02/mysql_backup/full/"
sudo rm -rf "/data/backup/*"
BACKUP_FILE="$BACKUP_DIR$BACKUP_NAME"
/bin/rsync ngosadm@172.16.1.74:$BACKUP_FILE /data/backup/
rsync_result=$?
echo "value $git_result"
if [ $rsync_result -ne 0 ]; then
    echo "rsync ERROR!!!!!!!!"
    exit 1
else
    echo "rsync OK!!!!!!"
fi
/bin/echo "Drop database vnw_click"
sudo docker exec -t $DOCKERID /bin/bash -c "/bin/echo 'DROP DATABASE vnw_click;' | mysql"
/bin/echo "Create Database vnw_click"
sudo docker exec -t $DOCKERID /bin/bash -c "/bin/echo 'CREATE DATABASE vnw_click;' | mysql"
/bin/echo "Import Database vnw_click"
sudo docker cp /data/backup/$BACKUP_NAME $DOCKERID:/data/backup/
sudo docker exec -t $DOCKERID /bin/bash -c "/bin/gunzip -c /data/backup/$BACKUP_NAME | mysql vnw_click"


[Sync-data-prod-to-staging]
DIR=/data/docker/volumes/vnw-core-dbnew/database-tool
BRANCH=develop
sudo /bin/bash -c "cd $DIR;git fetch origin;"
CUR_BRANCH=`sudo /bin/bash -c "cd $DIR;git branch" | grep "*" | awk '{print $2}'`
if [ "$CUR_BRANCH" != "$BRANCH" ]; then
    echo "Switch to new branch $BRANCH"
    sudo /bin/bash -c "cd $DIR;git checkout  $BRANCH"
fi
echo "Merge from origin/$BRANCH"
#sudo /bin/bash -c "cd $DIR;git reset --hard origin/$BRANCH"
sudo /bin/bash -c "cd $DIR;git pull origin $BRANCH"
git_result=$?
echo "value $git_result"
if [ $git_result -ne 0 ]; then
    echo "GIT ERROR!!!!!!!!"
else
    echo "GIT OK!!!!!!"
fi
sudo cp $DIR/Sync_vnw_core_from_Prod_to_Staging/maskdata_staging.sql /data/docker/volumes/vnw-core-dbnew/
sudo cp $DIR/Sync_vnw_core_from_Prod_to_Staging/update_domain_configuration_enviroment_new_staging.sql /data/docker/volumes/vnw-core-dbnew/
number_week=`/bin/date +%W`
BACKUP_NAME=`/bin/date +"backup_full_database_%Y%m%d.sql.gz" -d "last saturday"`
BACKUP_DIR="/online_backup/vdb04/mysql_backup/full/"
BACKUP_FILE="$BACKUP_DIR$BACKUP_NAME"
echo $BACKUP_NAME
echo $BACKUP_DIR
echo $BACKUP_FILE
#exit 1
rsync -avzh  --progress  ngosadm@172.16.1.74:$BACKUP_FILE /data/mysql_backup/vnw_core/
rsync_result=$?
echo "value $rsync_result"
if [ $rsync_result -ne 0 ]; then
    echo "rsync ERROR!!!!!!!!"
    exit 1
else
    echo "rsync OK!!!!!!"
fi
sudo cp /data/mysql_backup/vnw_core/$BACKUP_NAME /data/docker/volumes/vnw-core-dbnew/


for i in `sudo docker ps -a |grep vnw-core-dbnew | grep 33306 | awk '{print $1}'`
do
echo "clean file bin"
sudo docker exec -i $i /bin/bash -c "/bin/echo \"PURGE BINARY LOGS BEFORE '`/bin/date --date='yesterday' '+%Y-%m-%d 00:00:00'`';\" | mysql -uroot -p$password"
echo "Drop database vnw_core"
sudo docker exec -i $i /bin/bash -c "/bin/echo 'DROP DATABASE vnw_core;' | mysql -uroot -p$password"
echo "Create Database vnw_core"
sudo docker exec -i $i /bin/bash -c "/bin/echo 'CREATE DATABASE vnw_core;' | mysql -uroot -p$password"
echo "Import database vnw_core"
sudo docker exec -i $i /bin/bash -c "/bin/gunzip -c /data/mysql/$BACKUP_NAME | /usr/local/mysql/bin/mysql -uroot -p$password vnw_core"
echo 'Done !!!'
done