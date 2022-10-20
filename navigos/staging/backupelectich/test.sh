event_account_v1-* event_acl_tracking-* event_ats_tracking-* event_editjob_v1-* event_hotkeywords_v1-*


curl -H "Content-Type: application/json" -XPUT "localhost:9200/_snapshot/es_backup/event_account_v1-2022.10.18?wait_for_completion=true" -d '{"indices": "event_account_v1-*"}'