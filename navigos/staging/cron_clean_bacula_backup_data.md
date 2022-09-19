#!/bin/bash
if [ `sudo find /online_backup/jira/backups -type f -iname "jira-data*.gz" -mtime -240 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/jira/backups
    echo "------->None file create in 30 day"
fi

if [ `sudo find /online_backup/vdb04/mysql_backup/full -type f -iname "backup_full_database_*" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vdb04/mysql_backup/full
    echo "------->None file create in 30 day"
fi

if [ `sudo find /online_backup/vnw_db/db01 -type f -iname "mysql-bin.*" -mtime -310 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vnw_db/db01
    echo "------->None file create in 30 day"
fi
if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "postgres_bannerbooking_production*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "postgres_bannerbooking_production"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_api_oauth*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnw_api_oauth"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_hr_onboard*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_hr_onboard"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_smart_interview*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_smart_interview"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_click*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnw_click"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_navi_cms*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_navi_cms"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnworks_sims*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnworks_sims"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_ip2location*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_ip2location"
    echo "------->None file create in 30 day"
fi


if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_dwhdb*.gz" -mtime -60 | wc -c` > "0" ]; then
    echo "xoa duoc"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_dwhdb"
    echo "------->None file create in 30 day"
fi

if [ `find /online_backup/mongo_smartnavi/backup_full -type d -name "mongodump*" -mtime +90 | wc -c ` > "0" ]; then
    echo "xoa duoc"
else
    ls online_backup/mongo_smartnavi/backup_full
    echo "------->None file create in 30 day"
fi
