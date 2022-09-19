
import json
import requests
import sys

prod_kong_admin = "http://10.122.4.31:8001"


# kong.kyna-jobseekers
# Notifications for this service have been disabled	Perform Extra Service Actions
# WARNING	07-04-2022 16:03:02	0d 0h 0m 43s	4/4	kyna-jobseekers is UNHEALTHY: 10.122.5.137:31000:UNHEALTHY
# kong.onboarding
# Notifications for this service have been disabled	Perform Extra Service Actions
# WARNING	07-04-2022 16:03:04	0d 0h 0m 41s	4/4	onboarding is UNHEALTHY: 10.122.5.137:43323:UNHEALTHY
# kong.predictionio
# Notifications for this service have been disabled	Perform Extra Service Actions
# WARNING	07-04-2022 16:03:04	0d 0h 0m 41s	4/4	predictionio is UNHEALTHY: 10.122.5.114:42019:UNHEALTHY, 10.122.5.115:42019:UNHEALTHY, 10.122.5.113:42019:UNHEALTHY
# kong.resume-sync-es

prod_upstream_healthcheck_off = ["kyna-jobseekers"]

prod_template_header="""
###############################################################################
# template.CFG - OBJECT CONFIG FILE FOR MONITORING KONG SERVICE
# Author: Tuonghv
# Created: Apr 24, 2022
# Edited: Apr 24, 2022
###############################################################################


###############################################################################
# HOST DEFINITION
###############################################################################

define host{
        use                             navigos_linux_server                            ; Name of host template to use
        host_name                       kong_upstream                            
        alias                           kong_upstream                            
        hostgroups                      LoadBalance_Servers                             
        contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc    
        address                         10.122.4.43                                   
        icon_image                      lvs.gif                                         
        vrml_image                      lvs.gif                                         
        statusmap_image                 lvs.gif                                         
}


###############################################################################
# SERVICE DEFINITIONS
###############################################################################"""


prod_template_service="""
define service{
        use                             local-service,navigos_service_backend               
        host_name                       kong_upstream                                        
        service_description             kong_upstream.%s                                  
        check_command                   check_kong_upstreams!"%s"!"%s"                                                       
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc  
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1                                               
}                
                """

prod_path_template_output= "../../production/objects/navigosGroup/BackendService/kong_upstream.cfg"



# release

release_kong_admin = "http://172.16.4.93:8001"

release_upstream_healthcheck_off =  ["kyna-jobseekers","recommend-courses","api-homepage","homepage"]

release_template_header="""
###############################################################################
# vHP01.CFG - OBJECT CONFIG FILE FOR MONITORING KONG SERVICE
# Author: Tuonghv
# Created: Apr 24, 2022
# Edited: Apr 24, 2022
###############################################################################


###############################################################################
# HOST DEFINITION
###############################################################################

define host{
        use                             navigos_linux_server                            ; Name of host template to use
        host_name                       kong_upstream                            
        alias                           kong_upstream                            
        hostgroups                      LoadBalance_Servers                             
        contact_groups                  alert_api    
        address                         172.16.4.72                                   
        icon_image                      lvs.gif                                         
        vrml_image                      lvs.gif                                         
        statusmap_image                 lvs.gif                                         
}
"""


release_template_service="""
define service{
        use                             local-service,navigos_service_backend               
        host_name                       kong_upstream                                        
        service_description             kong_upstream.%s                                  
        check_command                   check_kong_upstreams!"%s"!"%s"                                                       
        # contact_groups                  alert_api,nagios_release  
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1                                               
}   
"""

release_path_template_output= "../../release/objects/NavigosReleaseServer/BackendService/kong_upstream.cfg"




# staging

staging_kong_admin = "http://172.16.4.24:8001"

staging_upstream_healthcheck_off = ["kyna-jobseekers","notification-test","product-invoices","longpq-test","test-longpham","web"]

staging_template_header="""
###############################################################################
# vHP01.CFG - OBJECT CONFIG FILE FOR MONITORING vHP01 DATABASE SERVER
# Author: Tuonghv
# Created: Apr 24, 2022
# Edited: Apr 24, 2022
###############################################################################


###############################################################################
# HOST DEFINITION
###############################################################################

define host{
        use                             navigos_linux_server                            ; Name of host template to use
        host_name                       kong_upstream                            
        alias                           kong_upstream                            
        hostgroups                      LoadBalance_Servers                                
        address                         172.16.5.43                                   
        icon_image                      nginx.jpg                                       
        vrml_image                      nginx.jpg                                       
        statusmap_image                 nginx.jpg                                          
}


###############################################################################
# SERVICE DEFINITIONS
###############################################################################

"""


staging_template_service="""
define service{
        use                             local-service,navigos_service_backend               
        host_name                       kong_upstream                                        
        service_description             kong_upstream.%s                                  
        check_command                   check_kong_upstreams!"%s"!"%s"                                                       
        # contact_groups                  alert_api  
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1                                               
}   
"""

staging_path_template_output= "../../staging/objects/NavigosGroup/BackendService/kong_upstream.cfg"




def generate_kong_upstream_template(path_nagios_output, kong_admin, template_header, template_service, upstream_healthcheck_off):
    file = open(path_nagios_output, "w+")
    file.writelines(template_header)
    try:
        response = requests.get(kong_admin + "/upstreams")
        data = response.json()
        for upstream in data['data']:
            try:
                upstream_id = upstream["id"]
                upstream_name = upstream["name"].replace("-backend", "").replace("_backend", "").replace("backend", "")
                # print("check upstream 0 %s" % upstream_name, flush=True)
                if upstream_name not in upstream_healthcheck_off and "test" not in upstream_name:
                    # print("check upstream %s" % upstream_name, flush=True)
                    check_link = kong_admin + '/upstreams/' + upstream_id + '/targets'
                    # print(check_link)
                    response_check = requests.get(check_link)
                    upstream_status = response_check.json()

                    # "target": "172.16.4.183:32549",
                    s = ""
                    for target_data in upstream_status['data']:
                        host = target_data["target"]
                        if s == "":
                            s = host
                        else:
                            s += "," + host

                    service = upstream_name
                    if s!="":
                        nagios = template_service % (service, service, s)
                        # print(nagios)
                        file.writelines(nagios)
                        # print("%s %s" % (upstream_name, s))


            except Exception as e:
                print(e)
    except Exception as e:
        print(e)

    file.close()



generate_kong_upstream_template(prod_path_template_output, prod_kong_admin, prod_template_header,prod_template_service, prod_upstream_healthcheck_off)

generate_kong_upstream_template(release_path_template_output, release_kong_admin, release_template_header,release_template_service, release_upstream_healthcheck_off)

generate_kong_upstream_template(staging_path_template_output, staging_kong_admin, staging_template_header,staging_template_service, staging_upstream_healthcheck_off)



