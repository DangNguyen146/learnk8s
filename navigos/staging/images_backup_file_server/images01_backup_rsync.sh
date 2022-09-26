sudo rsync -avzi --bwlimit=2000 --delete --exclude="rppy-processed" --exclude="rppy-error" --exclude="rppy-converted" /data/www/vnworks_images/html/ root@172.16.1.74:/data/www/staging-images01/html

e=$?
echo "status: $e"
if test $e = 24; then
    exit 0
fi
if test $e = 23; then
    exit 0
fi
exit $e