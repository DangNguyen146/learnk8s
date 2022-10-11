DIR="/data/apps/system-cron/system-cron-script"
DIR_DATA='/data/apps/system-cron/system-cron-script/monitoring/docker/staging'
sudo /bin/bash -c "cd $DIR;git pull origin master"


# 1 minute
schedule_interval=60

for i in $(seq 1 240)
do
    start=`date +%s`
    s=`date +"%T"`
    echo "start check $s"


    for i in `sudo docker ps -a  | grep "vnw/python_cron" | grep 'Up' | awk '{print $1}'`
    do
         echo "running"
         sudo docker exec -i $i /bin/sh -c "cd $DIR_DATA; python3 docker_cpu.py"
    done
    


    end=`date +%s`
    runtime=$((end-start))
    echo "1 minutes"
    sleeptime=$((schedule_interval-runtime))
    #echo "sleeptime $sleeptime"
    if [ $sleeptime -gt 0 ]; then
        echo "sleep: $sleeptime seconds"
        sleep $sleeptime
    fi 
done
