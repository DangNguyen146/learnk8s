

# Upgrading Elastic Stack from 6.8 to 7.x

## Preparing the Elastic Stack

### Stop the services
```
systemctl stop kibana
```

### Add the new repository for Elastic Stack 7.x:

```
  # rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
  # cat > /etc/yum.repos.d/elastic.repo << EOF
  [elasticsearch]
  name=Elasticsearch repository for 7.x packages
  baseurl=https://artifacts.elastic.co/packages/7.x/yum
  gpgcheck=1
  gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
  enabled=0
  autorefresh=1
  type=rpm-md
  EOF
```

## Upgrading Elasticsearch

### Disable shard allocation:
```
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "primaries"
  }
}
'
```

### Stop non-essential indexing and perform a synced flush (optional):
```
# curl -X POST "localhost:9200/_flush/synced"
```

### Shut down a single node:
```
# systemctl stop elasticsearch
```

### Upgrade the shut down node:
```
# sudo yum install --enablerepo=elasticsearch elasticsearch
```

### Restart the service:
```
# systemctl daemon-reload
# systemctl restart elasticsearch
```

### Start the newly-upgraded node and confirm that it joins the cluster by checking the log file or by submitting a `_cat/nodes` request:

```
# curl -X GET "localhost:9200/_cat/nodes"
```

### Reenable shard allocation:
```
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
'
```

### Before upgrading the next node, wait for the cluster to finish shard allocation:

```
curl -X GET "localhost:9200/_cat/health?v"
```
## connectine upgrade kibana
[upgrade_kibana_6.8_to_7.13](./upgrade_kibana_6.8_to_7.13.md)

### reference 

[upgrading elastic stack from 6.8 to 7.x](https://documentation.wazuh.com/current/upgrade-guide/legacy/upgrading-elastic-stack/from-6.8-to-7.x.html)

[Install elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html)
