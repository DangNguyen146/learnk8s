### Removing a Node from a Cluster
Next Topic
To safely remove a node from a cluster, perform the following steps:
Before you remove a node, ensure that each index has at least one replica. You can use the Elasticsearch Interact page to verify the replica count by choosing _cat/indices?v option in the Cluster API drop-down list.
Alternatively, you can use the Elasticsearch Cluster Dashboard to view the replica information in PeopleSoft Health Center.
Identify the IP address of the Elasticsearch node that needs to be removed from the cluster.
Open a command prompt window and execute the following command where X.X.X.X stands for the IP address of the node that needs to be removed and also replace the host:port with the IP or port of any of the nodes in the cluster.
```
curl -XPUT “http://<username:password@host:port>/_cluster/settings” -d 
'{
  "transient" :{
      "cluster.routing.allocation.exclude._ip" : "X.X.X.X"
   }
}'
```
```
curl -XPUT “http://<username:password@host:port>/_cluster/settings” -d 
'{
  "transient" :{
      "cluster.routing.allocation.exclude._name" : "nodeABC"
   }
}'
```


When the command is executed, Elasticsearch tries to move the existing shards out of the node that will be removed and moves it to other nodes in the cluster.
In a command prompt window, execute the following command to ensure that the relocation is complete and to validate that the relocating_shards attribute shows value as 0 (zero). Alternatively, you may use the _cluster/health option from the Cluster API drop-down list on the Elasticsearch Interact page.
```
curl -XGET http://<username:password@host:port>/_cluster/health?pretty
```
For example, 
```
$>curl -XGET http://esadmin:esadmin@slc10uax.us.oracle.com:9200/_cluster/health?pretty.
 {
  "cluster_name" : "ES_CLUSTER1",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 3,
  "number_of_data_nodes" : 3,
  "active_primary_shards" : 630,
  "active_shards" : 635,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```
Shutdown the node that was identified for removal.
Set the exclusion rules to empty so that, in the future, the removed node can be added back to the cluster and can be used to hold the shards.
curl -XPUT “http://username:password@host:port/_cluster/settings” -d 
'{
  "transient" :{
      "cluster.routing.allocation.exclude._ip" : ""
   }
}'
On the Search Instance Properties page, delete the row corresponding to the removed node.


# sample steps to remove a node from cluster
```
$ curl -X GET "localhost:9200/_cat/nodes"
cc36ecda6473 172.29.0.2 65 59 0.15 d * vnw-es-01
e45e95cd3411 172.29.0.2 48 55 0.37 d - vnw-es-05
1c4921068462 172.29.0.2 68 57 0.08 d - vnw-es-04
f2b4fed7cae5 172.29.0.2 39 60 0.28 d m vnw-es-02
d1c2374faf73 172.29.0.2 21 58 0.28 d - vnw-es-03
...
```

```
curl -X GET "localhost:9200/_cat/indices"
green open  suggester_skill_v3       6 1    31637    6185  15.6mb   7.8mb
      close company_index_v6
green open  company_index_v4         6 1   632914  184260     1gb 537.7mb
...
```

```
$ curl -X GET "localhost:9200/_cat/indices"
green open  suggester_skill_v3       6 1    31637    6185  15.6mb   7.8mb
      close company_index_v6
green open  company_index_v4         6 1   632914  184260     1gb 537.7mb
```

```
$ curl -X GET "localhost:9200/_cluster/health?pretty"
{
  "cluster_name" : "vnw-es",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 5,
  "number_of_data_nodes" : 5,
  "active_primary_shards" : 64,
  "active_shards" : 128,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0
}
```

```
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "transient" :{
     "cluster.routing.allocation.exclude._name" : "vnw-es-05"
   }
}
'
```

```
curl -s  -XGET "http://localhost:9200/_cat/shards" | grep "vnw-es-05"
vnw_company_candidate_v2 0 p RELOCATING 4461238      2gb 172.29.0.2 vnw-es-05 -> 172.29.0.2 sX7ijNuuTryLQYKJC-SbTg vnw-es-03
vnw_company_candidate_v2 5 p RELOCATING 5284364    2.4gb 172.29.0.2 vnw-es-05 -> 172.29.0.2 h9-ynu1WRE6ViWDStqV0WQ vnw-es-04
vnw_company_candidate_v2 4 p RELOCATING 4907629    2.3gb 172.29.0.2 vnw-es-05 -> 172.29.0.2 h9-ynu1WRE6ViWDStqV0WQ vnw-es-04
vnw_index_v18            1 p RELOCATING 2995402    2.4gb 172.29.0.2 vnw-es-05 -> 172.29.0.2 dTWRvzxpRIGXxT1u9bMYMw vnw-es-01
vnw_index_v18            2 r RELOCATING 3998761    3.6gb 172.29.0.2 vnw-es-05 -> 172.29.0.2 i4kr7GdFSYKIx-JmvT9GJQ vnw-es-02
company_index_v4         2 p RELOCATING  126532   98.5mb 172.29.0.2 vnw-es-05 -> 172.29.0.2 sX7ijNuuTryLQYKJC-SbTg vnw-es-03
company_index_v4         3 r RELOCATING   95550   70.5mb 172.29.0.2 vnw-es-05 -> 172.29.0.2 i4kr7GdFSYKIx-JmvT9GJQ vnw-es-02
```

```
$ curl -X GET "localhost:9200/_cluster/health?pretty"
{
  "cluster_name" : "vnw-es",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 5,
  "number_of_data_nodes" : 5,
  "active_primary_shards" : 64,
  "active_shards" : 128,
  "relocating_shards" : 6,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0
}
```

```
$  curl -s  -XGET "http://localhost:9200/_cat/shards" | grep "vnw-es-05"
$
```

```
$ curl -X GET "localhost:9200/_cluster/health?pretty"
{
  "cluster_name" : "vnw-es",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 5,
  "number_of_data_nodes" : 5,
  "active_primary_shards" : 64,
  "active_shards" : 128,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0
}
```


```
 docker stop e45e95cd3411

```

```
curl -X PUT "localhost:9200/_cluster/settings" -H 'Content-Type: application/json' -d'
{
  "transient" :{
     "cluster.routing.allocation.exclude._name" : ""
   }
}
'
```


### reference 

[removing-a-node-from-a-elasticsearch-cluster-gracefully](https://medium.com/@sanyamkj/removing-a-node-from-a-elasticsearch-cluster-gracefully-6122d00faf9)

[Removing A Node From A Cluster](https://docs.oracle.com/cd/E92519_02/pt856pbr3/eng/pt/tpst/task_RemovingANodeFromACluster.html?pli=ul_d46e43_tpst)
