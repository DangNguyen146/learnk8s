# Upgrading Kibana with RPM from 6.8 to 7.x

## Preparing the Elastic Stack

### Stop the services
```
systemctl stop kibana
```

### Add the new repository for Elastic Stack 7.x:

```
  # rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
  # cat > /etc/yum.repos.d/kibana.repo << EOF
  [kibana-7.x]
name=Kibana repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
  EOF
```

## Upgrading Kibana

### Install kibana
```
sudo yum install kibana
```

### Run kibana:
```
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable kibana.service
sudo systemctl start kibana.service
```

## Security elastic stack
[security_elasticsearch](security_elasticsearch.md)

### reference 

[Install kibana with rpm](https://www.elastic.co/guide/en/kibana/current/rpm.html)
