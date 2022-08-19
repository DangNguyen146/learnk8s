## snapshot in elasticsearch

Shared File System Repository
The shared file system repository ("type": "fs") uses the shared file system to store snapshots. In order to register the shared file system repository it is necessary to mount the same shared filesystem to the same location on all master and data nodes. This location (or one of its parent directories) must be registered in the path.repo setting on all master and data nodes.

Assuming that the shared filesystem is mounted to /mount/backups/my_backup, the following setting should be added to elasticsearch.yml file:
```
path.repo: ["/mnt/nfs/var/nfsshare","/mnt/nfs/es/nfsshare"]
```

### Confugration fs (share Filesystem)
For all master and data nodes 
```
 mount -t nfs 192.168.0.100:/var/nfsshare /mnt/nfs/var/nfsshare/
```
In elasticsearch For all master and data nodes
```
cat elasticsearch.yml
path.repo: ["/mnt/nfs/var/nfsshare"]
```

Restart elasticsearch
```
systemctl restart elasticsearch.service
```

Then check log file make sure everything is fine.


Create repo
```
curl -XPUT 'http://172.16.22.72:9200/_snapshot/es_snapshot' -H 'Content-Type: application/json' -d '{
    "type": "fs",
    "settings": {
        "location": "/mnt/nfs/var/nfsshare/es_snapshot",
        "compress": true
    }
}'
```

Using elasticvue to create and restore snapshot

More reference

server nfs (choose one node in cluster)
```
yum install nfs-utils
mkdir /var/nfsshare
chmod -R 755 /var/nfsshare
chown nfsnobody:nfsnobody /var/nfsshare
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
vi /etc/exports
/var/nfsshare    172.16.0.0/16(rw,sync,no_root_squash,no_all_squash)

systemctl restart nfs-server
cd /var/nfsshare
ls
> test.log
```

### for all master and data nodes
```
mkdir -p /mnt/nfs/es/nfsshare
mount -t nfs 172.16.22.74:/var/nfsshare /mnt/nfs/es/nfsshare
cd /mnt/nfs/es/nfsshare
```

Register snapshot for all master and data notes
```
mkdir -p /mnt/nfs/es/nfsshare/es_snapshot
chown -R elasticsearch:elasticsearch /mnt/nfs/es/nfsshare/es_snapshot

path.repo: ["/mnt/nfs/var/nfsshare","/mnt/nfs/es/nfsshare"]

systemctl restart elasticsearch.service

 curl -X GET "172.16.22.72:9200/_cat/nodes"
 curl -X GET "172.16.22.74:9200/_cat/nodes"
```

Register repository 
```
curl -XPUT 'http://172.16.22.72:9200/_snapshot/es_snapshot' -H 'Content-Type: application/json' -d '{
    "type": "fs",
    "settings": {
        "location": "/mnt/nfs/es/nfsshare/es_snapshot",
        "compress": true
    }
}'
```


### reference 

[nfs](../nfs/nfs.md)

[snapshots-register-repository](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html)

[snapshots in elasticsearch 5.5](https://www.elastic.co/guide/en/elasticsearch/reference/5.5/modules-snapshots.html)