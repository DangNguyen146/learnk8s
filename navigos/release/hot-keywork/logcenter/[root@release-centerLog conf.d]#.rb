[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <match event_hotkeywords.**>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#     <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type relabel
-bash: @type: command not found
[root@release-centerLog conf.d]#         @label @file_event_hotkeywords_log
-bash: @label: command not found
[root@release-centerLog conf.d]#     </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type relabel
-bash: @type: command not found
[root@release-centerLog conf.d]#         @label @es_event_hotkeywords_log
-bash: @label: command not found
[root@release-centerLog conf.d]#     </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <label @file_event_hotkeywords_log>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.application>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_file_event_hotkeywords_application
-bash: @id: command not found
[root@release-centerLog conf.d]#             path /data/td-agent/logs/release/event_hotkeywords_application
-bash: path: command not found
[root@release-centerLog conf.d]#             compress gzip
-bash: compress: command not found
[root@release-centerLog conf.d]#             <format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type json
-bash: @type: command not found
[root@release-centerLog conf.d]#             </format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <buffer time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_event_hotkeywords_application
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 timekey 1d
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 time_key time
-bash: time_key: command not found
[root@release-centerLog conf.d]#                 time_type string
-bash: time_type: command not found
[root@release-centerLog conf.d]#                 time_format %Y-%m-%dT%H:%M:%S.%N%z
-bash: time_format: command not found
[root@release-centerLog conf.d]#                 timezone Asia/Ho_Chi_Minh
-bash: timezone: command not found
[root@release-centerLog conf.d]#             </inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.suggestion>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_file_event_hotkeywords_suggestion
-bash: @id: command not found
[root@release-centerLog conf.d]#             path /data/td-agent/logs/release/event_hotkeywords_suggestion
-bash: path: command not found
[root@release-centerLog conf.d]#             compress gzip
-bash: compress: command not found
[root@release-centerLog conf.d]#             <format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type json
-bash: @type: command not found
[root@release-centerLog conf.d]#             </format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <buffer time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_event_hotkeywords_suggestion
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 timekey 1d
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 time_key time
-bash: time_key: command not found
[root@release-centerLog conf.d]#                 time_type string
-bash: time_type: command not found
[root@release-centerLog conf.d]#                 time_format %Y-%m-%dT%H:%M:%S.%N%z
-bash: time_format: command not found
[root@release-centerLog conf.d]#                 timezone Asia/Ho_Chi_Minh
-bash: timezone: command not found
[root@release-centerLog conf.d]#             </inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </label>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <label @es_event_hotkeywords_log>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.**>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type elasticsearch
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_es_event_hotkeywords_log
-bash: @id: command not found
[root@release-centerLog conf.d]#             host 172.16.4.47
Host 47.4.16.172.in-addr.arpa. not found: 3(NXDOMAIN)
[root@release-centerLog conf.d]#             port 9200
-bash: port: command not found
[root@release-centerLog conf.d]#             <buffer tag,time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_elasticsearch_event_hotkeywords_v1
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
_prefix event_hotkeywords_v1
            time_key_format "%Y-%m-%dT%H:%M:%S.%N%z"
            request_timeout 45s
        </store>
    </match>
</label>

[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 flush_mode immediate
-bash: flush_mode: command not found
[root@release-centerLog conf.d]#                 timekey 24h
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             logstash_format true
-bash: logstash_format: command not found
[root@release-centerLog conf.d]#             type_name keywords
-bash: type_name: command not found
[root@release-centerLog conf.d]#             logstash_prefix event_hotkeywords_v1
-bash: logstash_prefix: command not found
[root@release-centerLog conf.d]#             time_key_format "%Y-%m-%dT%H:%M:%S.%N%z"
-bash: time_key_format: command not found
[root@release-centerLog conf.d]#             request_timeout 45s
-bash: request_timeout: command not found
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </label>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <match event_hotkeywords.**>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#     <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type relabel
-bash: @type: command not found
[root@release-centerLog conf.d]#         @label @file_event_hotkeywords_log
-bash: @label: command not found
[root@release-centerLog conf.d]#     </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type relabel
-bash: @type: command not found
[root@release-centerLog conf.d]#         @label @es_event_hotkeywords_log
-bash: @label: command not found
[root@release-centerLog conf.d]#     </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <label @file_event_hotkeywords_log>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.application>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_file_event_hotkeywords_application
-bash: @id: command not found
[root@release-centerLog conf.d]#             path /data/td-agent/logs/release/event_hotkeywords_application
-bash: path: command not found
[root@release-centerLog conf.d]#             compress gzip
-bash: compress: command not found
[root@release-centerLog conf.d]#             <format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type json
-bash: @type: command not found
[root@release-centerLog conf.d]#             </format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <buffer time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_event_hotkeywords_application
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 timekey 1d
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 time_key time
-bash: time_key: command not found
[root@release-centerLog conf.d]#                 time_type string
-bash: time_type: command not found
[root@release-centerLog conf.d]#                 time_format %Y-%m-%dT%H:%M:%S.%N%z
-bash: time_format: command not found
[root@release-centerLog conf.d]#                 timezone Asia/Ho_Chi_Minh
-bash: timezone: command not found
[root@release-centerLog conf.d]#             </inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.suggestion>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_file_event_hotkeywords_suggestion
-bash: @id: command not found
[root@release-centerLog conf.d]#             path /data/td-agent/logs/release/event_hotkeywords_suggestion
-bash: path: command not found
[root@release-centerLog conf.d]#             compress gzip
-bash: compress: command not found
[root@release-centerLog conf.d]#             <format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type json
-bash: @type: command not found
[root@release-centerLog conf.d]#             </format>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <buffer time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_event_hotkeywords_suggestion
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 timekey 1d
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             <inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 time_key time
-bash: time_key: command not found
[root@release-centerLog conf.d]#                 time_type string
-bash: time_type: command not found
[root@release-centerLog conf.d]#                 time_format %Y-%m-%dT%H:%M:%S.%N%z
-bash: time_format: command not found
[root@release-centerLog conf.d]#                 timezone Asia/Ho_Chi_Minh
-bash: timezone: command not found
[root@release-centerLog conf.d]#             </inject>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </label>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
[root@release-centerLog conf.d]# <label @es_event_hotkeywords_log>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     <match event_hotkeywords.**>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#         @type copy
-bash: @type: command not found
[root@release-centerLog conf.d]#         <store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             @type elasticsearch
-bash: @type: command not found
[root@release-centerLog conf.d]#             @id out_es_event_hotkeywords_log
-bash: @id: command not found
[root@release-centerLog conf.d]#             host 172.16.4.47
Host 47.4.16.172.in-addr.arpa. not found: 3(NXDOMAIN)
[root@release-centerLog conf.d]#             port 9200
-bash: port: command not found
[root@release-centerLog conf.d]#             <buffer tag,time>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#                 @type file
-bash: @type: command not found
[root@release-centerLog conf.d]#                 flush_thread_count 1
-bash: flush_thread_count: command not found
[root@release-centerLog conf.d]#                 path /data/td-agent/logs/release/buffer/buffer_elasticsearch_event_hotkeywords_v1
-bash: path: command not found
[root@release-centerLog conf.d]#                 retry_max_times 17
-bash: retry_max_times: command not found
[root@release-centerLog conf.d]#                 chunk_limit_size 1024m
-bash: chunk_limit_size: command not found
[root@release-centerLog conf.d]#                 queue_limit_length 10240
-bash: queue_limit_length: command not found
[root@release-centerLog conf.d]#                 flush_mode immediate
-bash: flush_mode: command not found
[root@release-centerLog conf.d]#                 timekey 24h
-bash: timekey: command not found
[root@release-centerLog conf.d]#                 timekey_use_utc false   #added
-bash: timekey_use_utc: command not found
[root@release-centerLog conf.d]#                 timekey_zone Asia/Ho_Chi_Minh
-bash: timekey_zone: command not found
[root@release-centerLog conf.d]#             </buffer>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#             logstash_format true
-bash: logstash_format: command not found
[root@release-centerLog conf.d]#             type_name keywords
-bash: type_name: command not found
[root@release-centerLog conf.d]#             logstash_prefix event_hotkeywords_v1
-bash: logstash_prefix: command not found
[root@release-centerLog conf.d]#             time_key_format "%Y-%m-%dT%H:%M:%S.%N%z"
-bash: time_key_format: command not found
[root@release-centerLog conf.d]#             request_timeout 45s
-bash: request_timeout: command not found
[root@release-centerLog conf.d]#         </store>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]#     </match>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# </label>
-bash: syntax error near unexpected token `newline'
[root@release-centerLog conf.d]# 
