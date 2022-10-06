#172.16.5.113
#vnw_api_oauth+vnw_click+navi_cms
echo "vnw_api_oauth+vnw_click+navi_cms"
DIR='/data/docker/volumes/018f61663cef8990adcab7032616f2e5048ba4719748ba3b3dcefe828c9503fd/_data/backup'
DIR_DATA='/var/lib/mysql/backup'
TIME=`/bin/date +%Y%m%d`
DOCKERID=`sudo docker ps -a | grep 'microservice-database' | grep 'Up' | awk '{print $1}'`
sudo /bin/bash -c "cd $DIR;sudo rm -rf *.gz"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pxrZjOMV9i-9i6TEY4qdM -S /data/mysql/mysql.sock --databases vnw_api_oauth >  $DIR_DATA/backup_full_vnw_api_oauth_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pxrZjOMV9i-9i6TEY4qdM -S /data/mysql/mysql.sock --databases vnw_click >  $DIR_DATA/backup_full_vnw_click_$TIME.sql"
sudo docker exec -i $DOCKERID /bin/bash -c "/usr/bin/mysqldump -uroot -pxrZjOMV9i-9i6TEY4qdM -S /data/mysql/mysql.sock --databases navi_cms >  $DIR_DATA/backup_full_navi_cms_$TIME.sql"

sudo /bin/bash -c "cd $DIR;/bin/gzip *.sql"
sudo find $DIR -type f -print0 | while IFS= read -r -d $'\0' file;
  do sudo /bin/scp -r $file root@172.16.1.74:/online_backup/microdb_backup/staging/;
done