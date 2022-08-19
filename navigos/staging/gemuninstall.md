sudo su -
export GEM_HOME=/opt/td-agent/lib/ruby/gems/2.7.0/

export GEM_PATH=/opt/td-agent/lib/ruby/gems/2.7.0/

export FLUENT_CONF=/etc/td-agent/td-agent.conf

export FLUENT_PLUGIN=/etc/td-agent/plugin

export PATH="/opt/td-agent/bin/:$PATH"
gem uninstall elasticsearch 

gem uninstall elasticsearch-api -v 8.3.0

gem install elasticsearch -v 7.8.1 && gem list | grep elasticsearch

systemctl restart td-agent && sleep 3 && tail -f /var/log/td-agent/td-agent.log