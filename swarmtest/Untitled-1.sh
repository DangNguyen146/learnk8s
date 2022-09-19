#!/bin/bash
if [ `sudo find /online_backup/jira/ -type f -iname "jira-data*.gz" -mtime -240 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/jira/"
    echo `sudo find /online_backup/jira/ -type f -iname "jira-data*.gz" -mtime +240`
    sudo find /online_backup/jira/ -type f -iname "jira-data*.gz" -mtime +240 -exec rm {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/jira/backups
    echo "------->None file create in 240 day"
fi

if [ `sudo find /online_backup/vdb04/mysql_backup/full -type f -iname "backup_full_database_*" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vdb04/mysql_backup/full"
    echo `sudo find /online_backup/vdb04/mysql_backup/full -type f -iname "backup_full_database_*" -mtime +60`
    sudo find /online_backup/vdb04/mysql_backup/full -type f -iname "backup_full_database_*" -mtime +60 -exec rm {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vdb04/mysql_backup/full
    echo "------->None file create in 60 day"
fi

if [ `sudo find /online_backup/vnw_db/db01 -type f -iname "mysql-bin.*" -mtime -310 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vnw_db/db01"
    echo `sudo find /online_backup/vnw_db/db01 -type f -iname "mysql-bin.*" -mtime +310`
    sudo find /online_backup/vnw_db/db01 -type f -iname "mysql-bin.*" -mtime +310 -exec rm {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vnw_db/db01
    echo "------->None file create in 310 day"
fi

if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "postgres_bannerbooking_production*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=postgres_bannerbooking_production"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "postgres_bannerbooking_production*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "postgres_bannerbooking_production*.gz" -mtime +60 -exec rm {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "postgres_bannerbooking_production"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_api_oauth*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_vnw_api_oauth"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_api_oauth*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_api_oauth*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnw_api_oauth"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_hr_onboard*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_hr_onboard"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_hr_onboard*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_hr_onboard*.gz" -mtime +60 -exec rm {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_hr_onboard"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_smart_interview*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_smart_interview"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_smart_interview*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_smart_interview*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_smart_interview"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_click*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_vnw_click"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_click*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnw_click*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnw_click"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_navi_cms*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_navi_cms"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_navi_cms*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_navi_cms*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_navi_cms"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnworks_sims*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_vnworks_sims"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnworks_sims*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_vnworks_sims*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_vnworks_sims"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_ip2location*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_ip2location"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_ip2location*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_ip2location*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_ip2location"
    echo "------->None file create in 60 day"
fi


if [ `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_dwhdb*.gz" -mtime -60 | wc -l` != "0" ]; then
    echo "Remove file in /online_backup/vrsdb02/mysql_backup/full name=backup_full_dwhdb"
    echo `sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_dwhdb*.gz" -mtime +60`
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "backup_full_dwhdb*.gz" -mtime +60 -exec rm {} \;
    
        echo "-----------------------------> Complete <------------------------------"
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "backup_full_dwhdb"
    echo "------->None file create in 60 day"
fi

if [ `sudo find /online_backup/mongo_smartnavi/backup_full -type d -name "mongodump*" -mtime -90 | wc -l ` != "0" ]; then
    echo "Remove file in /online_backup/mongo_smartnavi/backup_full name=mongodump"
    echo `sudo find /online_backup/mongo_smartnavi/backup_full -type d -name "mongodump*" -mtime +90`
    sudo find /online_backup/mongo_smartnavi/backup_full -type d -name "mongodump*" -mtime +90 -exec rm -rf {} \;
    
    echo "-----------------------------> Complete <------------------------------"
else
    ls online_backup/mongo_smartnavi/backup_full
    echo "------->None file create in 90 day"
fi