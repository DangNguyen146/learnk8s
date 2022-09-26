# Backup file server images01, images02

## ENV: staging+ release
- Staging:
    [images01]: 172.16.22.32
    [images02]: 172.16.22.57

    upstream jenkinscronbackend {
        server 10.122.4.44:8080;
    }
    upstream jenkinsbackend {
        server 172.16.4.25:8080;
    }
- Release
    [images01]: 172.16.4.73
    [images02]: 172.16.4.87

+ Store in bacula: 172.16.1.74 


Reference:

https://jenkins-cron.vietnamworks.com/job/Production/job/Backups/job/images01_backup_rsync/configure




images_backup_file_server
/data/www/vnworks_images/html



sudo rsync -avzi --bwlimit=2000 --delete --exclude="rppy-processed" --exclude="rppy-error" --exclude="rppy-converted" /data/www/vnworks_images/html root@172.16.1.74:/data/www/staging/images01/html

e=$?
echo "status: $e"
if test $e = 24; then
    exit 0
fi
if test $e = 23; then
    exit 0
fi
exit $e