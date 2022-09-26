[see more][https://lzone.de/blog/Nagios-Check-Plugin-for-nofile-Limit]



for all rancher nodes

cd /data/www/Nagios/
cat /usr/local/nagios/etc/nrpe.cfg
vim /etc/nagios/nrpe.cfg
./lsof.sh
/usr/lib64/nagios/plugins/lsof.sh
cat /usr/lib64/nagios/plugins/lsof.log

>/usr/lib64/nagios/plugins/lsof.sh
vim /usr/lib64/nagios/plugins/lsof.sh
i
#!/bin/bash
global_max=$(cat /proc/sys/fs/file-nr 2>&1 |cut -f 3)

WARN_THRESHOLD=10000	# default warning:  80% of file limit used
CRITICAL_THRESHOLD=100000	# default critical: 90% of file limit used

WARN_PROCESS=1000
CRITICAL_PROCESS=1500

CHECK_LSOF=0
COUT_ALL_THRESHOLD=0

now=$(date +"%T")
echo "Start in time $now" > /usr/lib64/nagios/plugins/lsof.log
for i in $(ps aux | awk 'NR>1 {print $2}')
do
    result_open=`sudo ls -l /proc/${i}/fd 2>/dev/null`
    result=$?
    if [[ $result -eq 0  ]]; then
        count_openfile=`echo "$result_open" | wc -l`
        COUT_ALL_THRESHOLD=$(( COUT_ALL_THRESHOLD + ${count_openfile} ))
        if [ "$count_openfile" -gt "$WARN_PROCESS" ]; then
            if [ "$count_openfile" -gt "$CRITICAL_PROCESS" ]; then   
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=2
            else
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=1
            fi
        fi
    fi
done
curl_ratio=`echo "scale=10;$COUT_ALL_THRESHOLD*100/$global_max"|bc`
echo "Ratio PID open file is: $curl_ratio%, Total PID open file is: $COUT_ALL_THRESHOLD | all_ratio_threshold=$curl_ratio;;; all_threshold=$COUT_ALL_THRESHOLD;$WARN_THRESHOLD;$CRITICAL_THRESHOLD;" >> /usr/lib64/nagios/plugins/lsof.log;
if [ "$COUT_ALL_THRESHOLD" -gt "$WARN_THRESHOLD" ]; then
    if [ "$COUT_ALL_THRESHOLD" -gt "$CRITICAL_THRESHOLD" ]; then
        CHECK_LSOF=2
    fi
    CHECK_LSOF=1
fi
echo $CHECK_LSOF >> /usr/lib64/nagios/plugins/lsof.log
exit $CHECK_LSOF

crontab -e
0 */1 * * * cd /usr/lib64/nagios/plugins && sh lsof.sh


command[check_lsof]=/usr/lib64/nagios/plugins/lsof_thread.sh
cd /usr/lib64/nagios/plugins
vim lsof.sh
vim lsof_thread.sh
chmod +x lsof.sh
chmod +x lsof_thread.sh

+ staging                   lsof.sh     lsof_thread.sh      crontab -e
ssh root@172.16.4.161         x              x                x   
ssh root@172.16.4.162         x              x                x   
ssh root@172.16.4.151         x              x                x   
ssh root@172.16.4.152         x              x                x   
ssh root@172.16.4.153         x              x                x  
ssh root@172.16.4.181         x              x                x
ssh root@172.16.4.182         x              x                x
ssh root@172.16.4.183         x              x                x

lxf.R6s-BICT
+ release                   lsof.sh     lsof_thread.sh      crontab -e
ssh root@172.16.5.161         x              x                x   
ssh root@172.16.5.162         x              x                x   
ssh root@172.16.4.81          x              x                x   
ssh root@172.16.4.82          x              x                x   
ssh root@172.16.4.83          x              x                x   
ssh root@172.16.4.84          x              x                x   
ssh root@172.16.4.85          x              x                x   
ssh root@172.16.5.151         x              x                x   
ssh root@172.16.5.152         x              x                x   
ssh root@172.16.5.153         x              x                x   
 

sample script:

[tuonghv@vnhcmvt-rancher03 ~]$ cat lsof.sh
for i in $(ps aux | awk '{ print $2}')
do
    echo "PID # ${i} open files count : $(sudo ls -l /proc/${i}/fd | wc -l) name: $(ps -p ${i} -o comm=)"
done




command[check_lsof]=/usr/lib64/nagios/plugins/lsof_thread.sh
lsof.sh

rm -rf Openfile.rrd
rm -rf Openfile.xml

>lsof.sh
vim lsof.sh
i

#!/bin/bash
WARN_THRESHOLD=10000	# default warning:  80% of file limit used
CRITICAL_THRESHOLD=100000	# default critical: 90% of file limit used

WARN_PROCESS=1000
CRITICAL_PROCESS=1500

CHECK_LSOF=0
COUT_ALL_THRESHOLD=0

now=$(date +"%T")
echo "Start in time $now" > /usr/lib64/nagios/plugins/lsof.log
for i in $(ps aux | awk 'NR>1 {print $2}')
do
    result_open=`sudo ls -l /proc/${i}/fd 2>/dev/null`
    result=$?
    if [[ $result -eq 0  ]]; then
        count_openfile=`echo "$result_open" | wc -l`
        COUT_ALL_THRESHOLD=$(( COUT_ALL_THRESHOLD + ${count_openfile} ))
        if [ "$count_openfile" -gt "$WARN_PROCESS" ]; then
            if [ "$count_openfile" -gt "$CRITICAL_PROCESS" ]; then   
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=2
            else
                echo "PID # ${i} open files count : $count_openfile name: $(ps -p ${i} -o comm=)" >> /usr/lib64/nagios/plugins/lsof.log
                CHECK_LSOF=1
            fi
        fi
    fi
done

echo "Total PID open file is: $COUT_ALL_THRESHOLD" >> /usr/lib64/nagios/plugins/lsof.log
if [ "$COUT_ALL_THRESHOLD" -gt "$WARN_THRESHOLD" ]; then
    if [ "$COUT_ALL_THRESHOLD" -gt "$CRITICAL_THRESHOLD" ]; then
        CHECK_LSOF=2
    fi
    CHECK_LSOF=1
fi
echo $CHECK_LSOF >> /usr/lib64/nagios/plugins/lsof.log
exit $CHECK_LSOF

systemctl reload nrpe
sh lsof.sh

add chart
global_max=$(cat /proc/sys/fs/file-nr 2>&1 |cut -f 3)
global_cur=$(cat /proc/sys/fs/file-nr 2>&1 |cut -f 1)

cd /usr/local/pnp4nagios/var/perfdata


cd staging-rancherbe01
rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../

cd staging-rancherbe02/
rm -rf Openfile.rrd
rm -rf Openfile.xml

cd ../
cd staging-rancherscale01
rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../staging-rancherscale02

rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../staging-rancherscale03

rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../vStaging-Rancher01

rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../vStaging-Rancher02 

rm -rf Openfile.rrd
rm -rf Openfile.xml
cd ../vStaging-Rancher03

rm -rf Openfile.rrd
rm -rf Openfile.xml