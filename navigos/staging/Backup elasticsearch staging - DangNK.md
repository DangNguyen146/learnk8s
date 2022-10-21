# staging-es-log.vietnamworks.com

event_account_v1-*   
event_acl_tracking-*
event_ats_tracking-*
event_editjob_v1-*
event_hotkeywords_v1-*		

path.repo: ["/data/elasticsearch/backup"]



# check curl
curl -H "Content-Type: application/json" -GET "localhost:9200/_cat/indices/" 


vnw_job_v5 vnw_job_online_v5 vnw_job_views_v1



curl -H "Content-Type: application/json" -XPOST "localhost:9200/_aliases" -d '{
    "actions" : [
        { "add" : { "index" : "event_editjob_v1-*", "alias" : "event_editjob_v1-all" } }
    ]
}'

event_account_v1-all event_acl_tracking-all event_ats_tracking-all event_editjob_v1-all event_hotkeywords_v1-all