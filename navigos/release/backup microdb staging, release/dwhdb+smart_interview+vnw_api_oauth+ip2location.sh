# 172.16.4.113
# dwhdb:33306+ip2location:33306+smart_interview:33306+vnw_api_oauth:33306
echo "dwhdb:33306+smart_interview:33306+vnw_api_oauth:33306"
DIR='/data/docker/volumes/data-ip2location/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'data-ip2location' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;sudo rm -rf *.gz"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases dwhdb >  $DIR_DATA/backup_full_dwhdb_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases ip2location >  $DIR_DATA/backup_full_ip2location_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases smart_interview >  $DIR_DATA/backup_full_smart_interview_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases vnw_api_oauth >  $DIR_DATA/backup_full_vnw_api_oauth_$TIME.sql"

sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo find $DIR -type f -print0 | while IFS= read -r -d $'\0' file;
  do sudo /bin/scp -r $file root@172.16.1.74:/online_backup/microdb_backup/release/;
done