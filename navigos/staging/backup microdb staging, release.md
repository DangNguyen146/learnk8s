# ref: https://jenkins-cron.vietnamworks.com/job/Production/job/Backups/job/backup_full_microdb/configure
 

staging-msdb.vnw        A       172.16.5.113



1. dwhdb        
# release
    read: salary_readonly:P6xKVjaHMfwp9@tcp(172.16.4.113:33306)/dwhdb?readTimeout=10s&timeout=20s
    write: salary_readonly:P6xKVjaHMfwp9@tcp(172.16.4.113:33306)/dwhdb?readTimeout=10s&timeout=20s
# staging               ############## complete
    read: salary_readonly:P6xKVjaHMfwp9@tcp(172.16.4.21:33306)/dwhdb?readTimeout=10s&timeout=20s
    write: salary_readonly:P6xKVjaHMfwp9@tcp(172.16.4.21:33306)/dwhdb?readTimeout=10s&timeout=20s

[root@vDev-Web02 /]# docker exec -it b14ee4d9fdf3 bash
root@b14ee4d9fdf3:/# ls
backup_dwhdb_2020_09_24.sql  boot  docker-entrypoint-initdb.d  dwhdb_2021_03_11.sql  etc   ip2location.sql  lib64  mnt	proc  run   srv  tmp  var
bin			     dev   dwhdb.staging.20201008.sql  entrypoint.sh	     home  lib		    media  opt	root  sbin  sys  usr
 

 sudo docker exec -i b14ee4d9fdf3 bash -c "mysqldump -udatateam -pTuYAZobqSrmY0NLVeLTc --databases dwhdb > backup_full_dwhdb_test.sql"

2. ip2location ############## complete


# staging           ############## complete

3. smart_interview
 
# release
    database_interview_host: 172.16.4.113
    database_interview_port: 33306
    database_interview_name: smart_interview
 
# staging
    database_interview_host: 172.16.4.27
    database_interview_port: 3306
    database_interview_name: vnw_crawler



4. vnw_api_oauth
# release
MYSQL_API_OAUTH_HOST=172.16.4.113
MYSQL_API_OAUTH_PORT=33306
MYSQL_API_OAUTH_DATABASE_NAME=vnw_api_oauth
MYSQL_API_OAUTH_USER=micro_api
MYSQL_API_OAUTH_PASSWORD=mgxERXMtwnXcHWJuAFuTupRY
 
# staging
MYSQL_API_OAUTH_HOST=staging-msdb.vnw
MYSQL_API_OAUTH_PORT=3306
MYSQL_API_OAUTH_DATABASE_NAME=vnw_api_oauth
MYSQL_API_OAUTH_USER=micro_docker
MYSQL_API_OAUTH_PASSWORD=fSsmhnvGFVDFLSgRgH



4. vnworks_sims
# release
MYSQL_SIMS_HOST=172.16.4.27
MYSQL_SIMS_PORT=3306
MYSQL_SIMS_DATABASE_NAME=vnworks_sims
MYSQL_SIMS_USER=phongle
MYSQL_SIMS_PASSWORD=FqxwA9jrcU5sdwh935AK
 
# staging
MYSQL_SIMS_HOST=172.16.4.27
MYSQL_SIMS_PORT=3306
MYSQL_SIMS_DATABASE_NAME=vnworks_sims
MYSQL_SIMS_USER=navisync
MYSQL_SIMS_PASSWORD=AAcES4MncngYApuWcK
 

5. backup_full_vnw_click
 
# release
    slave: vnw_docker:Hg6a7sEbU2prgZ6vbbXUHxM6@tcp(172.16.4.113:3306)/vnw_click?readTimeout=10s&timeout=20s
    core: vnw_docker:Hg6a7sEbU2prgZ6vbbXUHxM6@tcp(172.16.4.111:3306)/vnw_core?readTimeout=10s&timeout=20s
# staging:
    slave: company_read:sWXdQrtD3VCrSMfn@tcp(staging-msdb.vnw:3306)/vnw_click?readTimeout=10s&timeout=20s
    core: company_read:sWXdQrtD3VCrSMfn@tcp(staging-slavedb.vnw:3306)/vnw_core?readTimeout=10s&timeout=20s
    172.16.5.113 staging-msdb.vnw
    172.16.5.112 staging-slavedb.vnw   



6. navi_cms
    clean_log "/online_backup/vrsdb02/mysql_backup/full" "backup_full_navi_cms*.gz" 60
 
# release
    navi_cms: navi_read:kuWPXTTdGEmAFZ8@tcp(172.16.4.113:3306)/navi_cms?readTimeout=10s&timeout=20s
 
# staging
    navi_cms: stag_banner:Ga~3ctCh@tcp(staging-msdb.vnw:3306)/navi_cms?readTimeout=10s&timeout=20s
    172.16.5.113 staging-msdb.vnw




 