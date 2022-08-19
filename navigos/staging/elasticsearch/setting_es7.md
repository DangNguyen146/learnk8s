## Change setting in elasticsearch



Configure max_open_scroll_context
```
curl -X PUT 'user:pass' localhost:9200/_cluster/settings -H 'Content-Type: application/json' -d'{
    "persistent" : {
        "search.max_open_scroll_context": 10000
    },
    "transient": {
        "search.max_open_scroll_context": 10000
    }
}
'
```

Configure max_shards_per_node
```
curl -X PUT localhost:9200/_cluster/settings -H "Content-Type: application/json" -d '{ "persistent": { "cluster.max_shards_per_node": "100000" } }'
```

### reference 

