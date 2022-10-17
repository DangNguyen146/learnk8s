env: release + production

 

setup package: python3.6 -m pip install pymssql

 

sample: Nagios/staging/objects/NavigosGroup/CRMService/crmserver.cfg

command: share via team (PM)

# Step1: Add allowhost in file [nsclient]
allowed hosts = 172.16.5.43

# Step2: In project nagios add command and defind comand
[NavigosCommands.cfg]
define command{
        command_name                    crm_alias_cpu                             
        command_line                    $USER1$/check_nrpe -c alias_cpu -H "172.16.1.120"
}
[crmserver.cfg]
define service{
        use                             local-service,navigos_crm_service
        host_name                       crmserver
        service_description             crmserver.alias_cpu 
        check_command                   crm_alias_cpu
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            5                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           1                                              ; Re-notify about service problems every hour
        notifications_enabled           0
        register                        1
}
# add commant
"C:\Program Files\Python310\python\python.exe" "C:\Program Files\NSClient++\scripts\python\monitorcrm.py" -h 172.16.1.114:1433 -u nagios -p N@vigos12345 -d distribution -o CRMStagingPub -n CRM2016UAT-NavigosGroup_MSCRM-CRMStagingPub-CRM365DBTEST01-34



nscp py add --script "C:\Program Files\NSClient++\scripts\python\monitorcrm.py"

 nscp --client --module PythonScript --command execute-and-load-python --script test.py