yum install -y epel-release
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum install nrpe -y
sudo systemctl enable nrpe

yum install nagios-plugins-{load,http,users,procs,disk,swap,nrpe,uptime} -y
 
command[check_users]=/usr/lib64/nagios/plugins/check_users -w 5 -c 10
command[check_load]=/usr/lib64/nagios/plugins/check_load -w 1,2,5 -c 30,25,20 -r 4
command[check_zombie_procs]=/usr/lib64/nagios/plugins/check_procs -w 5 -c 10 -s Z
command[check_procs]=/usr/lib64/nagios/plugins/check_procs -w 300 -c 400
command[check_disk_data]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /data
command[check_disk_root]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /
command[check_swap]=/usr/lib64/nagios/plugins/check_swap -w 20 -c 10
command[check_memory]=/usr/lib64/nagios/plugins/pmp-check-unix-memory -w 95 -c 99 -d

yum install vim


## allow host
/etc/nagios/nrpe.cfg
allowed_hosts=127.0.0.1,::1,10.122.4.43,172.16.4.72


staging
allowed_hosts=127.0.0.1,::1,172.16.5.43


systemctl start nrpe
systemctl reload nrpe
systemctl status nrpe


chmod +x /usr/lib64/nagios/plugins/check_cpu_usage.sh
chmod +x /usr/lib64/nagios/plugins/pmp-check-unix-memory