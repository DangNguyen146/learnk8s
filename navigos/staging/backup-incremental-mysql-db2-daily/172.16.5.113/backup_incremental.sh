sudo rsync -avzi --bwlimit=2000 --delete /data/docker/volumes/018f61663cef8990adcab7032616f2e5048ba4719748ba3b3dcefe828c9503fd/_data root@172.16.1.74:/online_backup/microdb/staging/microservice-database

e=$?
echo "status: $e"
if test $e = 24; then
    exit 0
fi
if test $e = 23; then
    exit 0
fi
exit $e