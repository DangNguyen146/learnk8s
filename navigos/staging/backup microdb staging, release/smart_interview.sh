DIR='/var/lib/docker/volumes/ab3b4c73dd90d6463097fa1d4ecc436336af5221b654560e92f38f3a5012342b/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'mysql' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;rm -rf *.gz"
sudo docker exec -i bf6dc6d78260 /bin/bash -c "/usr/bin/mysqldump -uroot -pTuYAZobqSrmY0NLVeLTc --databases vnw_crawler > backup_full_vnw_crawler_test.sql"

sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo /bin/scp -r $DIR/ root@172.16.1.74:/online_backup/microdb_backup/

