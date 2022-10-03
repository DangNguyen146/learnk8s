### Scan bacula disk and plan to clean log


Add cron to clean up these backup

 
172.16.1.74:/online_backup/vreleasedb02/mysql_backup/daily
172.16.1.74:/online_backup/vreleasedb02/mysql_backup/weekly
172.16.1.74:/online_backup/vstagingdb02/mysql_backup/daily
172.16.1.74:/online_backup/vstagingdb02/mysql_backup/weekly

show file in folder [bakula_disk_plan_clean_log]


+ là trước ngày đó
- là sao ngày đó



will kich thước floder

du -sh * | grep "G\|T"
df