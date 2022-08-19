#### Rancher staging to accesslog staging - Rancher release to accesslog release

Fluent script: http://git.navigosgroup.com/system-archive/fluentd_archive/-/blob/master/script/prod/10.122.5.131/conf.d/docker.conf [doker_stats/docker.conf]
 
### Sample script:
## Host: 10.122.5.132

    [root@vnhcmvt-rancherms02 container_stats]# pwd
        /data/www/container_stats

    [root@vnhcmvt-rancherms02 container_stats]# ls -alt
        rw-rr- 1 root root 1238 Feb 16 13:00 docker-stats.sh
        rw-rr- 1 root root 212 Feb 13 09:42 docker_stats_rotate.conf

    [root@vnhcmvt-rancherms02 container_stats]# crontab -l
        */5 * * * * cd /data/www/container_stats && sh docker-stats.sh

    [root@vnhcmvt-rancher01 conf.d]# pwd
        /etc/td-agent/conf.d
    [root@vnhcmvt-rancher01 conf.d]# ls docker.conf
        docker.conf

## Location ip file
    10.122.4.52\docker.conf
    172.16.4.45\ docker.conf

### Model
 - Production
    rancher > logcenter (td-agent) ip: 10.122.4.52 >> [kibana server (td-agent) >> elasticsearch IP: 172.16.4.45
 - Staging
    rancher > logcenter (td-agent) ip: 172.16.5.75 >> [kibana server (td-agent) >> elasticsearch IP: 172.16.5.47
 
 - List staging server:
        staging-rancherbe01 - 172.16.4.161
        staging-rancherbe02 - 172.16.4.162
        staging-rancherscale01 - 172.16.4.151
        staging-rancherscale02 - 172.16.4.152
        staging-rancherscale03 - 172.16.4.153
        vStaging-Rancher01 - 172.16.4.181
        vStaging-Rancher02 - 172.16.4.182
        vStaging-Rancher03 - 172.16.4.183

ssh dangnk@172.16.4.183 -p 7770
yes
lxf.R6s-BICT

### How to do it?
## Step 1: Write script run crontab in client
 - Install fluentd
 - Add script crontab
        mkdir -p /data/www/container_stats && cd /data/www/container_stats
        mkdir -p /data/www/container_stats/logs/ && cd /data/www/container_stats/logs/ && touch docker.log && ls
 - Add file
vi docker-stats.sh
vi docker_stats_rotate.conf
        rw-rr- 1 root root 1238 Feb 16 13:00 docker-stats.sh
        rw-rr- 1 root root 212 Feb 13 09:42 docker_stats_rotate.conf
 - Config crontab
 crontab -e
        */5 * * * * cd /data/www/container_stats && sh docker-stats.sh
    * Check is running 
                        grep "docker-stats.sh" /var/log/cron
 - Add td-agent in conf.d
    vim /etc/td-agent/conf.d/docker.conf

## Step 2: Add script .conf in logcenter
        cd /etc/td-agent/conf.d
        vim docker.conf

## Step 3: Add script forward docker.conf logcenter
 - Add script [docker.rb] in [/data/www/config/scripts/script/docker.rb]
 - 

td-agent tai kibana service

 

 