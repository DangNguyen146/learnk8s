### monitor, em add cái template monitor cơ bản và 2 disk


### Add monitor bacula server Nagios [relase]:
Bacula IP: 172.16.1.74
    login: ldap non-prod
nrpe config: cat /usr/local/nagios/etc/nrpe.cfg

### reload
systemctl reload nrpe
systemctl status nrpe

 

### Monitor disk
 - 99% /data
 - 85% /online_backup

### add aloww host

### Install nagios
https://support.nagios.com/kb/article.php?id=515#CentOS

command[check_users]=/usr/local/nagios/libexec/check_users -w 5 -c 10
command[check_load]=/usr/local/nagios/libexec/check_load -r -w .15,.10,.05 -c .30,.25,.20
command[check_hda1]=/usr/local/nagios/libexec/check_disk -w 20% -c 10% -p /dev/hda1
command[check_zombie_procs]=/usr/local/nagios/libexec/check_procs -w 5 -c 10 -s Z
command[check_total_procs]=/usr/local/nagios/libexec/check_procs -w 150 -c 200

command[check_disk_data]=/usr/local/nagios/libexec/check_disk -w 1% -c 0% -p /data
command[check_disk_online_backup]=/usr/local/nagios/libexec/check_disk -w 1% -c 0% -p /online_backup

command[check_disk_root]=/usr/local/nagios/libexec/check_disk -w 5% -c 1% -p /
command[check_swap]=/usr/local/nagios/libexec/check_swap -w 20 -c 10
command[check_memory]=/usr/local/nagios/libexec/pmp-check-unix-memory -w 95 -c 99 -d
command[check_cpu]=/usr/local/nagios/libexec/check_cpu_usage.sh -w 80 -c 90 -d