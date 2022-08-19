# Set up minimal security for Elasticsearche

## Enable Elasticsearch security features

### Add the xpack.security.enabled setting to the ES_PATH_CONF/elasticsearch.yml file and set the value to true and set your cluster has a single node:
```
cd /etc/elasticsearch
xpack.security.enabled: true
discovery.type: single-node
```

## Turn on security

### Restart elasticsearch
```
sudo systemctl start elasticsearch.service
```

### Generate password:
```
cd /usr/share/elasticsearch
./bin/elasticsearch-setup-passwords auto
```


## Integrate Kibana with elasticsearch:
### Create the Kibana keystore:
```
cd /usr/share/kibana
./bin/kibana-keystore create
```

### Add the password for the kibana_system user to the Kibana keystore:
```
./bin/kibana-keystore add elasticsearch.password
```
### Restart Kibana:
```
sudo systemctl start kibana.service
```


### reference 
<https://www.elastic.co/guide/en/elasticsearch/reference/current/security-minimal-setup.html>
