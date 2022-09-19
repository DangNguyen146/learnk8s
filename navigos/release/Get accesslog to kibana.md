#### Server loadbalacer of envairement  release

## Release:
    * 172.16.4.93 —> internal-lb01-release
    * 172.16.4.94 —> internal-lb02-release
    * 172.16.4.91 —> lb01
    * 172.16.4.92 —> lb02

    --> Model
                    LogCenter		Kibana
    172.16.4.91 —> 172.16.4.75 —> 172.16.4.47
    172.16.4.92

### How to do it?
## Step 1: Install fluentd in client
 - Install fluentd
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent4.sh | sh

sed -i 's/User=td-agent/User=root/g' /usr/lib/systemd/system/td-agent.service
sed -i 's/Group=td-agent/Group=root/g' /usr/lib/systemd/system/td-agent.service
systemctl daemon-reload
systemctl enable td-agent.service

rm /etc/td-agent/td-agent.conf -f
mkdir /etc/td-agent/conf.d
echo '@include /etc/td-agent/conf.d/*.conf' > /etc/td-agent/td-agent.conf
mkdir -p /data/td-agent/tmp/
mkdir -p /data/td-agent/logs/prod/buffer/
ls /data/td-agent/tmp/
systemctl start td-agent.service
systemctl status td-agent.service
 - Install packet
        gem install [....]
            * packet: fluent-plugin-filter_typecast, fluent-plugin-script
        Error version ruby
export GEM_HOME=/opt/td-agent/lib/ruby/gems/2.7.0/
export GEM_PATH=/opt/td-agent/lib/ruby/gems/2.7.0/
export FLUENT_CONF=/etc/td-agent/td-agent.conf
export FLUENT_PLUGIN=/etc/td-agent/plugin
export PATH="/opt/td-agent/bin/:$PATH"
/opt/td-agent/bin/fluentd --dry-run -c /etc/td-agent/td-agent.conf
 - Edit config td-agent
        cd /etc/td-agent/
        vim td-agent.conf
            * add text in header file
                <source>
                    @type forward
                    port 1514
                    bind 0.0.0.0
                    skip_invalid_event true
                </source>
<system>
    # equal to -qq option
    #log_level trace
</system>  
 - Add config fix read log
        cd /etc/td-agent/conf.d
        vim vnw.conf [vnw.conf] [ change ip to logcenter ]
            * Log forward to logcenter
 - Check config file before run
        /opt/td-agent/bin/fluentd --dry-run -c /etc/td-agent/td-agent.conf
 - Run fluentd
        systemctl restart td-agent  && sleep 3 && tail -f /var/log/td-agent/td-agent.log
        systemctl status td-agent 
## Step 2: Install fluentd in logcenter
 - Install fluentd like step 1
 - Config file forword
        cd /etc/td-agent/conf.d
        vim access.conf [access.conf] [ change ip to kibana ]
## Step 3: Install fluentd in logcenter
 - [readFolder] [Elasticsearch]
 - If no indices match pattern "daxtra_access-*" --> add filter in access.conf