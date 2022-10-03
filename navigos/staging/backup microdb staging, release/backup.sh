DIR='/data/docker/volumes/ip2location/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'dwhdb' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;rm -rf *.gz"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -pP6xKVjaHMfwp9 --databases dwhdb > $DIR_DATA/backup_full_dwhdb_$TIME.sql"


sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -psSjTxWqRVhzYO3rY --databases ip2location > $DIR_DATA/backup_full_ip2location_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -psSjTxWqRVhzYO3rY --databases smart_interview > $DIR_DATA/backup_full_smart_interview_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -psSjTxWqRVhzYO3rY --databases vnw_api_oauth > $DIR_DATA/backup_full_vnw_api_oauth_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -udatateam -psSjTxWqRVhzYO3rY --databases vnworks_sims > $DIR_DATA/backup_full_vnworks_sims_$TIME.sql"


sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo /bin/scp $DIR/*  root@172.16.1.74:/online_backup/vrsdb02/mysql_backup/full/