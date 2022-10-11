#!/bin/bash
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

clean_log_folder ( ) { 
    dir_clean=$1
    name_pattern=$2
    clean_time=$3
    if [ `sudo find $dir_clean -type f -iname "$name_pattern" -mtime -$clean_time | wc -l` != "0" ]; then
        echo "Remove file in $dir_clean name=$name_pattern"
        echo `sudo find $dir_clean -type f -iname "$name_pattern" -mtime +$clean_time`
        sudo find $dir_clean -type f -iname "$name_pattern" -mtime +$clean_time -exec rm -rf {} \;
        echo "-----------------------------> Complete <------------------------------"
    else
        ls $dir_clean | grep "$name_pattern"
        echo "------->None file create in $clean_time day"
    fi
}
# logrotate
clean_log "/online_backup/vstagingdb02/mysql_backup/weekly/" "*" 60
clean_log "/online_backup/vstagingdb02/mysql_backup/daily" "*" 30

# 
clean_log "/online_backup/jira/backups" "jira-data*.gz" 60
clean_log "/online_backup/jira/backups" "jira-export*.gz" 60
clean_log "/online_backup/vdb04/mysql_backup/full" "backup_full_database_*" 60
clean_log "/online_backup/vnw_db/db01" "mysql-bin.*" 90

clean_log "/online_backup/microdb/mysql_backup/full" "postgres_bannerbooking_production*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_vnw_api_oauth*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_hr_onboard*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_smart_interview*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_vnw_click*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_navi_cms*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_vnworks_sims*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_ip2location*.gz" 60
clean_log "/online_backup/microdb/mysql_backup/full" "backup_full_dwhdb*.gz" 60

clean_log_folder "/online_backup/mongo_smartnavi/backup_full" "mongodump*" 90
clean_log_folder "/online_backup/mongo_smartnavi/backup_incremental" "*" 90

# bakula_disk_plan_clean_log
clean_log "/online_backup/vreleasedb02/mysql_backup/daily" "mysql-bin.*" 60
clean_log "/online_backup/vreleasedb02/mysql_backup/weekly" "backup_full_database_*" 60
clean_log "/online_backup/vstagingdb02/mysql_backup/daily" "mysql-bin.*" 60
clean_log "/online_backup/vstagingdb02/mysql_backup/weekly" "backup_full_database_*" 60

# /online_backup/staging-jenskins