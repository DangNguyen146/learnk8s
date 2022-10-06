Monitor tcp to postgres port

 

+ staging (internal loadbalancer)

   172.16.5.93:5432

   172.16.5.94:5432

+ release  LongPQ not install yet


Source

define service{
        use                             navigos_tcp_service
        host_name                       vnhcmvt-msdb03
        service_description             kong postgres database 
        check_command                   check_tcp_vip!$HOSTADDRESS$!5432!2!5!
        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour
        contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 1 minute under normal conditions
        notifications_enabled           1
        register                        1                               
}
