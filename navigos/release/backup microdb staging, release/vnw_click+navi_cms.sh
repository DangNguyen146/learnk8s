# 172.16.4.113
# vnw_click:3306, navi_cms:3306
echo "vnw_click:3306 + navi_cms:3306"
DIR='/data/docker/volumes/mysql/_data/backup'
DIR_DATA='/data/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'release-RSDB01' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;sudo rm -rf *.gz"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -S /data/mysql/mysql.sock --databases vnw_click >  $DIR_DATA/backup_full_vnw_click_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -S /data/mysql/mysql.sock --databases navi_cms >  $DIR_DATA/backup_full_navi_cms_$TIME.sql"

sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo find $DIR -type f -print0 | while IFS= read -r -d $'\0' file;
  do sudo /bin/scp -r $file root@172.16.1.74:/online_backup/microdb_backup/release/;
done