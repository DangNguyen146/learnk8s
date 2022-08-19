declare -a config_consumers=(
"apply_queue"
"apply_queue_backup"
"browser_notification"
"candidate_notification"
"candidate_onboarding_event_queue"
"candidate_onboarding_queue"
"candidate_queue"
"candidate_speech2text_event_queue"
"candidate_speech2text_queue"
"company_profile_page_view_queue"
"company_queue"
"daxtra_log"
"fcm"
"job_tracking_log_queue"
"micro_log"
"micro_notification_hub_queue"
"mobile_message_mkt_remove_invalid_token_queue"
"onboarding_log_queue"
"onesignal"
"online_payment_event_queue_002"
"online_payment_log_queue"
"online_payment_queue_001"
"push_vnw_notification"
"remove_vnw_notification"
"resume_processor"
"resume_processor_docx"
"send_email_q"
"send_email_queue"
"send_email_topjob"
"speech2text_log_queue"
"sync_no_of_applications_job_queue"
)
check_rabbit_consumer () {
    tmp_log=/tmp/tmp_active_rabbit_consumer.log
    container_id=`sudo docker ps  | grep 'rabbitmq' | grep -v 'POD' | awk '{print $1}'`
    sudo docker exec -i $container_id /bin/sh -c "rabbitmqctl list_consumers" | sed 1,2d | awk '{print "_vvv_"$1"_vvv_"}' | sort | uniq | grep -v amq.gen > $tmp_log
    #sudo cat $tmp_log
    not_found_list=""
    for consumer in "${config_consumers[@]}"; do
        # echo "-----------------------------------------"
        # echo "Find consumer: $consumer"
        ret_consumer=`sudo grep "_vvv_"$consumer"_vvv_" $tmp_log  | wc -l`
        # echo "ret_consumer: $ret_consumer"
        if  [ "$ret_consumer" == "0" ]; then
                not_found_list="$not_found_list , $consumer"
        fi
    done
    sudo rm -f $tmp_log
    echo "$not_found_list"
}
not_found_list=$(check_rabbit_consumer)
if [ ! -z "$not_found_list" ]; then
    echo "queue have no active consumer: $not_found_list"
    sleep 600
    echo "check again consumer"
    not_found_list2=$(check_rabbit_consumer)
    if [ "$not_found_list" = "$not_found_list2" ]; then
        echo "queue have no active consumer: $not_found_list2"
        text="There are no active consumers for these queues: $not_found_list"
    fi
fi