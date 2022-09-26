def cause = currentBuild.getBuildCauses('hudson.triggers.TimerTrigger$TimerTriggerCause').toString()
if (cause.contains('timer')) {
    currentBuild.description = "Job auto run by Schedule"
} else {
    user = "${currentBuild.getBuildCauses()[0].userName}"
    currentBuild.description = "Job run manual by ${user}"
}

pipeline {
    agent any
    stages {
        stage('Run Command') {
            stages {
                stage('Run SSH Command: 1') {
                    steps {
                        sshagent(['61fdf336-a982-44d3-9165-8538ad1bf69e']) {
                            sh '''ssh -tT -o StrictHostKeyChecking=no -p 7770 ngosadm@172.16.4.111 /bin/bash << 'SSH'
sudo bash /data/docker/volumes/mysql/_data/mysql_backup/backup_incremental.sh
SSH
                            '''
                        }
                    }
                }
            }
        }
    }
    post {
        failure {  
             mail bcc: '', body: "<b>Project: ${env.JOB_NAME} </b><br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "quang.duy.nguyen@navigosgroup.com";  
        }  
    }
}