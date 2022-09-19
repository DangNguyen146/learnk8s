import sys
import datetime
import os




prod_path_upstream= "/data/www/loadbalancer/production/docker/nginx/upstream.conf"
prod_upstream_healthcheck_off = ["faq","hrinsider","jenkins","jenkinscron","micro_web","onlinepay"]

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
        host_name                       lb-nginx                            
        alias                           lb-nginx                            
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
        host_name                       lb-nginx                                        
        service_description             lb-nginx.%s                                  
        check_command                   check_kong_upstreams!"%s"!"%s"!"%s"                                                       
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc  
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1                                               
}                
                """

prod_path_template_output= "../../production/objects/navigosGroup/BackendService/lb-nginx.cfg"



# release


release_path_upstream= "/data/www/loadbalancer/release/docker/nginx/upstream.conf"
release_upstream_healthcheck_off =  ["faq","hrinsider","jenkins","jenkinscron","micro_web","onlinepay","nagios","skill_tags","speech-to-text","standard-jobs"]

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
        host_name                       lb-nginx                            
        alias                           lb-nginx                            
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
        host_name                       lb-nginx                                        
        service_description             lb-nginx.%s                                  
        check_command                   check_kong_upstreams!"%s"!"%s"!"%s"                                                       
        # contact_groups                  alert_api,nagios_release  
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1                                               
}   
"""

release_path_template_output= "../../release/objects/NavigosReleaseServer/BackendService/lb-nginx.cfg"




# staging


staging_path_upstream= "/data/www/loadbalancer/staging/docker/nginx/upstream.conf"
staging_upstream_healthcheck_off = ["faq","hrinsider","jenkins","jenkinscron","micro_web","onlinepay","admin","booking","fronends_onlinepay","images2","images3","nagios","sims","standard-jobs","widget"]

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
        host_name                       lb-nginx                            
        alias                           lb-nginx                            
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
        host_name                       lb-nginx
        service_description             lb-nginx.%s
        check_command                   navigos_check_nginx_resolve_response!"%s"!"%s"!"%s"
        # contact_groups                alert_api
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            1                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                               ; Re-notify about service problems every hour                                                    
        notifications_enabled           0
        register                        1
}   
"""

staging_path_template_output= "../../staging/objects/NavigosGroup/BackendService/lb-nginx.cfg"
list_pro_nginx_servername_and_proxy={
    "adminbackend": "admin.vietnamworks.com",
"webservicesbackend": "api.vietnamworks.com",
"webservicesbackend": "api.vietnamworks.com",
"employerbackend": "employer.vietnamworks.com",
"employerbackend": "employer.vietnamworks.com",
"faqbackend": "faq.vietnamworks.com",
"faqbackend": "faq.vietnamworks.com",
"images2_backend": "images02.vietnamworks.com",
"images2_backend": "images02.vietnamworks.com",
"images3_backend": "images03.vietnamworks.com",
"images3_backend": "mages03.vietnamworks.com",
"images4_backend": "images04.vietnamworks.com",
"images4_backend": "images04.vietnamworks.com",
"images3_backend": "images.vietnamworks.com",
"images_backend": "images.vietnamworks.com",
"images3_backend": "images.vietnamworks.com",
"images_backend": "images.vietnamworks.com",
"vnw_nld_homepape": "job.nld.com.vn",
"api-gateway-backend": "ms.vietnamworks.com",
"api-gateway-backend": "ms.vietnamworks.com",
"openapibackend": "openapi.vietnamworks.com",
"jenkinscronbackend": "jenkins-cron.vietnamworks.com",
"jenkinsbackend": "jenkins.vietnamworks.com",
"repositorybackend": "jenkins.vietnamworks.com",
"repository-docker-backend": "jenkins.vietnamworks.com",
"securebackend": "secure.vietnamworks.com",
"securebackend": "secure.vietnamworks.com",
"sentrytrackbackend": "sentry-track.vietnamworks.com",
"simsbackend":"sims.vietnamworks.com",
"superadminbackend": "superadmin.vietnamworks.com",
"employerdashboardfrontend": "superadmin.vietnamworks.com",
"frontends_onboarding": "superadmin.vietnamworks.com",
"techexpobackend": "techexpo.vietnamworks.com",
"vnwbackend_nossl": "www.vietnamworks.com",
"vnw_page_container": "www.vietnamworks.com",
"widgetbackend": "widget.vietnamworks.com",
"vnw_wowcv": "wowcv.vietnamworks.com"
}
list_release_nginx_servername_and_proxy={
"adminbackend": "release-admin.vietnamworks.com",
"webservicesbackend": "release-api.vietnamworks.com",
"employerbackend": "release-employer.vietnamworks.com",
"employerbackend": "release-employer.vietnamworks.com",
"esbackend": "release-es.vietnamworks.com",
"grafanabackend": "rafana.vietnamworks.com",
"images3_backend": "release-images03.vietnamworks.com",
"images3_backend": "release-images03.vietnamworks.com",
"images4_backend": "release-images04.vietnamworks.com",
"images4_backend": "release-images04.vietnamworks.com",
"images3_backend": "release-images.vietnamworks.com",
"images_backend": "release-images.vietnamworks.com",
"images3_backend": "release-images.vietnamworks.com",
"images_backend": "release-images.vietnamworks.com",
"jenkinsbackend": "release-jenkins.vietnamworks.com",
"api-gateway-backend": "release-ms.vietnamworks.com",
"api-gateway-backend": "release-ms.vietnamworks.com",
"nagiosbackend": "release-nagios.vietnamworks.com",
"openapibackend": "release-openapi.vietnamworks.com",
"registrybackend": "release-registry.vietnamworks.com",
"repository-docker-backend": "release-repository.vietnamworks.com",
"repositorybackend": "release-repository.vietnamworks.com",
"securebackend": "release-secure.vietnamworks.com",
"securebackend": "release-secure.vietnamworks.com",
"simsbackend": "release-sims.vietnamworks.com",
"superadminbackend": "release-superadmin.vietnamworks.com",
"employerdashboardfrontend": "release-superadmin.vietnamworks.com",
"frontends_onboarding": "release-superadmin.vietnamworks.com",
"superadminbackend": "release-superadmin.vietnamworks.com",
"vnwbackend_nossl": "www.vietnamworks.com",
"vnw_page_container": "www.vietnamworks.com",
"vnwbackend_nossl": "release.vietnamworks.com",
"vnw_page_container": "release.vietnamworks.com",
"vnw_wowcv": "release-wowcv.vietnamworks.com"
}
list_staging_nginx_servername_and_proxy={
    "apply_multiple_jobs":"staging.vietnamworks.com",
   "adminbackend":"staging-admin.vietnamworks.com",
   "webservicesbackend":"api-staging.vietnamworks.com",
   "booking":"booking.vietnamworks.com",
   "devjenkinsbackend":"dev-jenkins.vietnamworks.com",
   "devgitbackend":"dev-git.vietnamworks.com",
   "172.16.5.51:4443":"dev-registry.vietnamworks.com",
   "172.16.5.53:8080":"git.navigosgroup.com",
   "employerbackend":"staging-employer.vietnamworks.com",
   "faqbackend":"staging-faq.vietnamworks.com",
   "grafanabackend":"grafana.vietnamworks.com",
   "images_backend":"staging-images.vietnamworks.com",
   "images3_backend":"staging-images.vietnamworks.com",
   "image-service":"staging-images.vietnamworks.com",
   "images2_backend":"staging-images02.vietnamworks.com",
   "images4_backend":"staging-images04.vietnamworks.com",
   "jenkinsbackend":"staging-jenkins.vietnamworks.com",
   "api-gateway-backend":"staging-ms.vietnamworks.com",
   "nagiosbackend":"staging-nagios.vietnamworks.com",
   "navibackend":"stage-navi_cms.vietnamworks.com",
   "openapibackend":"staging-openapi.vietnamworks.com",
   "registrybackend":"staging-registry.vietnamworks.com",
   "securebackend":"staging-secure.vietnamworks.com",
   "sentrytrackbackend":"staging-sentry.vietnamworks.com",
   "simsbackend":"staging-sims.vietnamworks.com",
   "superadminbackend":"staging-superadmin.vietnamworks.com",
   "fronends_onboarding":"staging-superadmin.vietnamworks.com",
   "employerdashboardfrontend":"staging-superadmin.vietnamworks.com",
   "vnw_page_container":"staging.vietnamworks.com",
   "vnwbackend_nossl":"staging.vietnamworks.com",
   "widgetbackend":"staging-widget.vietnamworks.com",
   "vnw_wowcv":"staging-wowcv.vietnamworks.com"
}


def load_upstream(upstream_file, path_nagios_output, template_header, template_service, upstream_healthcheck_off, host_mapping):
    file = open(path_nagios_output, "w+")
    file.writelines(template_header)
    upstreams = {}
    upstreams_org={}
    try:
        with open(upstream_file) as fp:
            line = fp.readline()
            cnt = 1
            current_upstream = ""
            while line:
                # print("Line {}: {}".format(cnt, line.strip()))
                mline = line.strip()
                if mline.find("upstream") == 0:
                    upstream_name = mline.replace("upstream", "")
                    upstream_name = upstream_name.replace("{", "").strip()
                    current_upstream = upstream_name

                    current_upstream = current_upstream.replace("vnwbackend_nossl", "vietnamworks")
                    current_upstream = current_upstream.replace("standardbackend", "standard-jobs")
                    current_upstream = current_upstream.replace("_v2", "")
                    current_upstream = current_upstream.replace("vnw_", "")
                    current_upstream = current_upstream.replace("-backend", "")
                    current_upstream = current_upstream.replace("_backend", "")
                    current_upstream = current_upstream.replace("backend", "")
                    upstreams_org[current_upstream]=upstream_name
                    # print(current_upstream)

                if mline.find("server") == 0:
                    mserver = mline.replace("server", "").replace(";", "").strip().split()[0]
                    # print(mserver)
                    if current_upstream not in upstream_healthcheck_off and "test" not in current_upstream :
                        if current_upstream in upstreams:
                            # print(current_upstream)
                            # print(upstreams[current_upstream])
                            upstreams[current_upstream] += "," + mserver

                        else:
                            # print(current_upstream)
                            upstreams[current_upstream] = mserver
                line = fp.readline()
                cnt += 1

        list_keys = []
        for key in upstreams.keys():
            list_keys.append(key)
        list_keys.sort()
        nagios=""

        for key in list_keys:
            try:
                upstream_name = upstreams_org[key]
                if key not in upstream_healthcheck_off and "test" not in key:
                    if upstream_name in host_mapping:
                        nagios = template_service % (
                        key, key, host_mapping[upstream_name], upstreams[key])
                        file.writelines(nagios)
                    # else:
                    #     print("not found hostname for %s " % upstream_name)

                    #     nagios = template_service % (
                    #     key, "onboarding", "", key)
                    #     file.writelines(nagios)

                    # print(nagios)
            except Exception as e:
                print(e)
                pass

    except Exception as e:
        print(e)

    file.close()


# load_upstream(prod_path_upstream, prod_path_template_output, prod_template_header, prod_template_service, prod_upstream_healthcheck_off, list_pro_nginx_servername_and_proxy)
load_upstream(release_path_upstream, release_path_template_output, release_template_header, release_template_service, release_upstream_healthcheck_off, list_release_nginx_servername_and_proxy)
# load_upstream(staging_path_upstream, staging_path_template_output, staging_template_header, staging_template_service, staging_upstream_healthcheck_off, list_staging_nginx_servername_and_proxy)
