backup_dir=/data/docker/volumes/mysql/_data/mysql_backup/daily
LogFile=/data/docker/volumes/mysql/_data/mysql_backup/bak.log
BinDir=/data/docker/volumes/8d83ebb21121e3d6f9439f962355389262167a774af4053e6348a25b22f4ce51/_data
BinFile=/data/docker/volumes/8d83ebb21121e3d6f9439f962355389262167a774af4053e6348a25b22f4ce51/_data/mysql-bin.index
for i in `sudo docker ps -a | grep "mysql" | grep "Up"  | awk '{print $1}'`
do
    sudo docker exec -i c6d2a03050cb /bin/sh -c "mysqladmin -S /data/mysql/mysql.sock flush-logs"
    Counter=`wc -l $BinFile | awk '{print $1}'`
    NextNum=0
    for file in `cat $BinFile`
    do
        base=`basename $file`
        NextNum=`expr $NextNum + 1`
        if [[ "$NextNum" -eq "$Counter" ]]
        then
                echo $base skip! >> $LogFile
        else
                dest=$backup_dir/$base
                if [ -f $dest ]
                then
                         echo $base exist! >> $LogFile
                else
                        cp $BinDir/$base $backup_dir
			            echo $BinDir/$base
			            rsync -av --no-o --no-g --progress '-e ssh -p 22' $BinDir/$base 172.16.1.74::release-slavedb-daily
                        echo $base copying >> $LogFile
                fi
        fi
    done
     find $backup_dir -ctime +7 -exec rm {} +;
     tail -10 /data/docker/volumes/mysql/_data/mysql_backup/bak.log
done