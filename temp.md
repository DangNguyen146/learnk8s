2022-08-18 13:06:03 +0700 [info]: #0 starting fluentd worker pid=30654 ppid=30651 worker=0
2022-08-18 13:06:03 +0700 [info]: #0 listening port port=1514 bind="0.0.0.0"
2022-08-18 13:06:03 +0700 [info]: #0 fluentd worker is now running worker=0
2022-08-18 13:06:22 +0700 [warn]: #0 record_reformer: failed to expand `%Q[#{record['route']['name']}]` error_class=NoMethodError error="undefined method `[]' for nil:NilClass"
  2022-08-18 13:06:22 +0700 [warn]: #0 (eval):1:in `expand'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:329:in `instance_eval'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:329:in `expand'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:309:in `expand'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:149:in `expand_placeholders'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:154:in `block in expand_placeholders'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:152:in `each_pair'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:152:in `expand_placeholders'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:142:in `reform'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:108:in `block in process'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/event.rb:110:in `each'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/core.rb:102:in `process'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluent-plugin-record-reformer-0.9.1/lib/fluent/plugin/out_record_reformer/v14.rb:19:in `process'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin/output.rb:840:in `emit_sync'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/event_router.rb:115:in `emit_stream'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/event_router.rb:106:in `emit'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin/in_udp.rb:86:in `block (2 levels) in start'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin/parser_json.rb:78:in `parse'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin/in_udp.rb:75:in `block in start'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin_helper/server.rb:562:in `on_readable_with_sock'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/cool.io-1.7.1/lib/cool.io/io.rb:186:in `on_readable'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/cool.io-1.7.1/lib/cool.io/loop.rb:88:in `run_once'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/cool.io-1.7.1/lib/cool.io/loop.rb:88:in `run'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin_helper/event_loop.rb:93:in `block in start'
  2022-08-18 13:06:22 +0700 [warn]: #0 /opt/td-agent/lib/ruby/gems/2.7.0/gems/fluentd-1.15.1/lib/fluent/plugin_helper/thread.rb:78:in `block in thread_create'
2022-08-18 13:06:22 +0700 [warn]: #0 record_reformer: failed to expand `%Q[#{record['route']['name']}]` error_class=NoMethodError error="undefined method `[]' for nil:NilClass"
  2022-08-18 13:06:22 +0700 [warn]: #0 suppressed same stacktrace


${if record['route']['name']?"/";"index" ;else; record['route']['name'] end;}