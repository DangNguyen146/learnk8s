#!/bin/bash
echo 'sudo find /online_backup/vreleasedb02/mysql_backup/daily -type f -iname "mysql-bin.*" -mtime +90'
sudo find /online_backup/vreleasedb02/mysql_backup/daily -type f -iname "mysql-bin.*" -mtime +90
echo "_______________________________________"
echo 'sudo find /online_backup/vreleasedb02/mysql_backup/weekly -type f -iname "backup_full_database_*" -mtime +90'
sudo find /online_backup/vreleasedb02/mysql_backup/weekly -type f -iname "backup_full_database_*" -mtime +90
echo "_______________________________________"
echo 'sudo find /online_backup/vstagingdb02/mysql_backup/daily -type f -iname "mysql-bin.*" -mtime +90'
sudo find /online_backup/vstagingdb02/mysql_backup/daily -type f -iname "mysql-bin.*" -mtime +90
echo "_______________________________________"
echo 'sudo find /online_backup/vstagingdb02/mysql_backup/weekly -type f -iname "backup_full_database_*" -mtime +90'
sudo find /online_backup/vstagingdb02/mysql_backup/weekly -type f -iname "backup_full_database_*" -mtime +90




clean_log ( ) { 
    dir_clean=$1
    name_pattern=$2
    clean_time=$3
    if [ `sudo find $dir_clean -type f -iname "$name_pattern" -mtime -$clean_time | wc -l` != "0" ]; then
        echo "Remove file in $dir_clean name=$name_pattern"
        echo `sudo find $dir_clean -type f -iname "$name_pattern" -mtime +$clean_time`
        sudo find $dir_clean -type f -iname "$name_pattern" -mtime +$clean_time -exec rm {} \;
        echo "-----------------------------> Complete <------------------------------"
    else
        ls $dir_clean | grep "$name_pattern"
        echo "------->None file create in $clean_time day"
    fi
}
clean_log "/online_backup/vreleasedb02/mysql_backup/daily" "mysql-bin.*" 183
clean_log "/online_backup/vreleasedb02/mysql_backup/weekly" "backup_full_database_*" 183
clean_log "/online_backup/vstagingdb02/mysql_backup/daily" "mysql-bin.*" 183
clean_log "/online_backup/vstagingdb02/mysql_backup/weekly" "backup_full_database_*" 183