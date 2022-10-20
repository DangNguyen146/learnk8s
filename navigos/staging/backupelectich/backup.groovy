// def job
def cause = currentBuild.getBuildCauses('hudson.triggers.TimerTrigger$TimerTriggerCause').toString()
if (cause.contains('timer')) {
    currentBuild.description = 'Job auto run by Schedule'
} else {
    user = "${currentBuild.getBuildCauses()[0].userName}"
    currentBuild.description = "Job run manual by ${user}"
}

pipeline {
    agent any
//     triggers {
//         cron('''TZ=Asia/Ho_Chi_Minh
// 30 4 1-8,16-23 * 6
//         ''')
//     }
    environment{
        DATE = sh(returnStdout: true, script: '''/bin/date +%Y%m%d''').trim()
    }
    stages {
        stage('Confirm to run job') {
            options {
                timeout(time: 60, activity:true, unit: 'SECONDS')
            }
            steps {
                script {
                    if (cause.contains('timer')) {
                        job="yes"
                        return
                    }
                    if (params.auto == 'yes') {
                        job = params.auto
                        currentBuild.description = "Job auto run by project ${params.name}"
                        return
                    }
                    def userInput = input(
                    id: 'userInput', ok: 'Run', message: 'Let\'s confirm this run !', parameters: [
                        choice(choices: 'no\nyes', name: 'Run', description: 'Choose "yes" if you want to deploy this build')]
                    )
                    job = userInput
                }
            }
        }
        stage('Backup snapshot ES') {
            when {
                expression { job == 'yes' }
            }
            steps {
                script{
                    stage("Create snapshot"){
                        sh """ssh -tT -o StrictHostKeyChecking=no -p 7770 ngosadm@${ES_HOST} /bin/bash << 'SSH'
set +x
sudo -i

for ES_INDEX in ${ES_INDEXS} ; do
    echo -e " #################### CREATE SNAPSHOT INDEX \${ES_INDEX} ####################\n"
    INDEX_BACKUP_NAME=\${ES_INDEX}_bk_${DATE}

    curl -XPUT "localhost:9200/_snapshot/es_backup/\${INDEX_BACKUP_NAME}?wait_for_completion=true" -d '{"indices": "\${ES_INDEX}"}' | grep state\\":\\"SUCCESS
    if [ "\$?" == "1" ]; then
        echo -e " -- create snapshot \${INDEX_BACKUP_NAME} failed!!!\n"
        exit 1
    fi
    echo -e " -- create snapshot \${INDEX_BACKUP_NAME} done\n"

    sudo tar -czvf ${ES_BACKUP_DIR}/\${INDEX_BACKUP_NAME}.tar.gz $ES_SNAPSHOT_DIR
    if [ "\$?" == "1" ]; then
        echo -e "-- compress snapshot failed\n"
        exit 1
    fi
    echo -e " -- compress snapshot done\n"

    curl -XDELETE "localhost:9200/_snapshot/es_backup/\${INDEX_BACKUP_NAME}" | grep acknowledged\\":true
    if [ "\$?" == "1" ]; then
        echo -e "delete snapshot \${INDEX_BACKUP_NAME} failed!!!\n"
        exit 1
    fi
    curl -XGET "localhost:9200/_snapshot/es_backup/\${INDEX_BACKUP_NAME}/_status" | grep status\\":404
    if [ "\$?" == "1" ]; then
        echo -e "delete snapshot \${INDEX_BACKUP_NAME} failed!!!\n"
        exit 1
    fi
    sudo rm -rf ${ES_SNAPSHOT_DIR}/indices
    echo -e " -- delete snapshot \${INDEX_BACKUP_NAME} done\n"
done
SSH
                        """
                    }
                    
                    stage("Rsync to bacula server"){
                        sh """ssh -tT -o StrictHostKeyChecking=no -p 7770 ngosadm@${ES_HOST} /bin/bash << 'SSH'
set +x
sudo -i 
rsync -avzh --bwlimit=2000 ${ES_BACKUP_DIR}/ root@172.16.1.74:${BACULA_BACKUP_DIR}
if [ "\$?" == "1" ]; then
    echo -e "-- Rsync failed\n"
    exit 1
fi
echo -e " -- Rsync done\n"
SSH
                        """
                    }
                    stage("Remove old file "){
                        sh"""ssh -tT -o StrictHostKeyChecking=no -p 7770 ngosadm@${ES_HOST} /bin/bash << 'SSH'
set +x
sudo -i 
sudo /usr/bin/find $ES_BACKUP_DIR/ -ctime +30  -exec ls -al {} \\;
sudo /usr/bin/find $ES_BACKUP_DIR/ -ctime +30  -exec rm -rf {} \\;
echo " -- clear backup... done"
SSH
                        """
                    }
                }
            }
        }
    }
}






curl -H "Content-Type: application/json" -XPUT "localhost:9200/_snapshot/event_account_v1-*_bk_20221017?wait_for_completion=true" -d '{"indices": "event_account_v1-*"}'





{"error":{"root_cause":[{"type":"illegal_argument_exception","reason":"request [/_snapshot/event_account_v1-*_bk_20221017] contains unrecognized parameter: [wait_for_completion]"}],"type":"illegal_argument_exception","reason":"request [/_snapshot/event_account_v1-*_bk_20221017] contains unrecognized parameter: [wait_for_completion]"},"status":400}





??l^W^Hsnapshot^@^@^@^A:)
^E?~Gsnapshot?~Cnameaevent_hotkeywords_v1-2022.08.01_bk~CuuidUYVushm4FQk2X34PQJ96uBw~Iversion_id$^MVQ~N~Findices?`.kibana_task_manager_pre7.4.0_001Q.kibana_7.17.5_001O.geoip_databasesE.tasks^.kibana_task_manager_7.13.4_001L.async-searchO.apm-custom-link^.kibana_task_manager_7.17.5_001Q.kibana_7.13.4_001H.kibana_1W.apm-agent-configuration^event_hotkeywords_v1-2022.08.01?~Kdata_streams??~DstateFSUCCESS~Sinclude_global_state#~Istart_time%^AA_.^FX~^~Gend_time%^AA_.^G^W~@~Ktotal_shards?~Psuccessful_shards?~Gfailures??~Mfeature_states??~Kfeature_nameDgeoipD?O.geoip_databases???NKasync_searchD?L.async-search???NDtasksD?E.tasks???NEkibanaD?Q.kibana_7.17.5_001O.apm-custom-link`.kibana_task_manager_pre7.4.0_001W.apm-agent-configuration^.kibana_task_manager_7.17.5_001H.kibana_1Q.kibana_7.13.4_001^.kibana_task_manager_7.13.4_001???~Lindex_details?~^.kibana_task_manager_7.17.5_001?~Jshard_count?~Lsize_in_bytes$^L^?^G?~Umax_segments_per_shard??~O.geoip_databases?Q?R$R}^[~VS??~Q.kibana_7.13.4_001?Q?R$^D*l?S??| .kibana_task_manager_pre7.4.0_001?Q?R$^AO~RS??~H.kibana_1?Q?R$^Bb~VS??~^.kibana_task_manager_7.13.4_001?Q?R$/nA~JS??~E.tasks?Q?R$^Of~XS??~W.apm-agent-configuration?Q?R$^F| S??~O.apm-custom-link?Q?R$^F| S??~L.async-search?Q?R$^AR~BS??~Q.kibana_7.17.5_001?Q?R$^D@P?S??~^event_hotkeywords_v1-2022.08.01?Q?R$"z?S??????(~S?^@^@^@^@^@^@^@^@?~H~[?