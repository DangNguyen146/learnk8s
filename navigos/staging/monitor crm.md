
# Step1: Copy your source code python use monitor to C:\Program Files\NSClient++\scripts\python

# Step2: Add allowhost in file [nsclient] C:\Program Files\NSClient++\nsclientnsclient.ini
        allowed hosts = 172.16.22.83,172.16.5.43,172.16.4.72,10.122.4.43 //host nagios

# Step3:  Install packet pymssql
Open cmd run as admin 

        cd "C:\Program Files\NSClient++\"

Run cmd as admin in folder C:\Program Files\NSClient++

        powershell.exe python -m pip install pymssql

# Step4:  Add command monitor line
Add the command to the last line of the file C:\Program Files\NSClient++\nsclient.ini

        [/settings/external scripts/scripts]
        ; monitor_crm staging
        monitorcrm_staging = powershell.exe python ./scripts/python/monitorcrm.py -h 172.16.1.114:1433 -u nagios -p N@vigos12345 -d distribution -o CRMStagingPub -n CRM2016UAT-NavigosGroup_MSCRM-CRMStagingPub-CRM365DBTEST01-34

        ; monitor_crm release
        monitorcrm_release = powershell.exe python ./scripts/python/monitorcrm.py  -h 172.16.1.116:1433 -u nagios -p N@vigos12345 -d distribution -o CRM_ReleasePub -n CRM365UAT-NavigosGroup_MSCRM-CRM_ReleasePub-CRM365-TEST01-31

# Step 5: Restart nsclient++
- Open Service as admin --> Select service Nsclient++ 64x (Right click) --> Restart

# Step 6: In repo nagios
### Add defend command in file
[staging]
staging/objects/NavigosTemplates/NavigosCommands.cfg
[release]
release/objects/NavigosTemplates/NavigosCommands.cfg
Demo with staging:

        define command{
                command_name                    monitorcrm_staging                             
                command_line                    $USER1$/check_nrpe -c monitorcrm_staging -H "172.16.1.120"
        }

Demo with release:

        define command{
                command_name                    monitorcrm_release                             
                command_line                    $USER1$/check_nrpe -c monitorcrm_release -H "172.16.1.120"
        }

* -H "172.16.1.120" because this is server run script python
### In file crmserver.cfg


Demo with staging:

        define service{
                use                             local-service,navigos_crm_service
                host_name                       crmserver
                service_description             crmserver.monitorcrm_staging
                check_command                   monitorcrm_staging 
                # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
                normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
                retry_check_interval            5                                               ; Re-check the service every two minutes until a hard state can be determined
                notification_interval           1                                              ; Re-notify about service problems every hour
                notifications_enabled           0
                register                        1
        }

Demo with release:

        define service{
                use                             local-service,navigos_crm_service
                host_name                       crmserver
                service_description             crmserver.monitorcrm_release
                check_command                   monitorcrm_release 
                # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
                normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
                retry_check_interval            5                                               ; Re-check the service every two minutes until a hard state can be determined
                notification_interval           1                                              ; Re-notify about service problems every hour
                notifications_enabled           0
                register                        1
        }



#### If dont't group, in file staging/objects/NavigosTemplates/ServiceTemplates.cfg

        # Navigos Web service definition template - This is NOT a real service, just a template!
        define service{
                name                            navigos_crm_service                         ; The name of this service template
                use                             navigos_generic_service,srv-pnp                 ; Inherit default values from the generic-service definition
                max_check_attempts              4                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
                check_interval                  1                                               ; Re-check the service every minute until a hard state can be determined
        #       notification_interval           60                                              
                servicegroups                   CRM_Service_Group                               
                # contact_groups                  System_Admins                                   
                register                        0                                               ; DONT REGISTER THIS DEFINITION - ITS NOT A REAL SERVICE, JUST A TEMPLATE!
        }

#### And file 

staging/objects/NavigosTemplates/NavigosServiceGroups.cfg

        # Service Backend Group #
        define servicegroup{
                servicegroup_name               CRM_Service_Group                               ; The group of services which check for Web Resources
                alias                           CRM Service Group                               ; Long name of the group
        }