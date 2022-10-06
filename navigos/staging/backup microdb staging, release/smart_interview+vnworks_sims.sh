#172.16.4.27
#smart_interview+vnworks_sims
echo "smart_interview+vnworks_sims"
DIR='/var/lib/docker/volumes/ab3b4c73dd90d6463097fa1d4ecc436336af5221b654560e92f38f3a5012342b/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'mysql-server-5.7' | grep 'Up' | awk '{print $1}'`

sudo /bin/bash -c "cd $DIR;sudo rm -rf *.gz"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases vnw_crawler >  $DIR_DATA/backup_full_vnw_crawler_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases vnworks_sims >  $DIR_DATA/backup_full_vnworks_sims_$TIME.sql"

sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo find $DIR -type f -print0 | while IFS= read -r -d $'\0' file;
  do sudo /bin/scp -r $file root@172.16.1.74:/online_backup/microdb_backup/staging/;
done