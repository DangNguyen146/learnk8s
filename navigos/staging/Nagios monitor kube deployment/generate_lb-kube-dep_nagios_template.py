import sys

production_kuber_healthcheck_off= ["job-sync-nodeport","micro-navi-cms-nodeport", "NAMESPACE", ]
release_kuber_healthcheck_off= ["job-sync-nodeport","micro-navi-cms-nodeport","release-vnw-nodeport","release-vnw-nodeport", "NAMESPACE", "kube-system", "cattle-prometheus", "cattle-system", "security-scan", "default-token", "ingress-nginx", "istio-system"]
staging_kuber_healthcheck_off= ["check_kube_nodes", "NAMESPACE", "cattle"]

production_template_service="""
define service{
        use                             local-service,navigos_service_backend
        host_name                       rancher-agent
        service_description             deployments.%s        check_command                   check_kube_deployments_v2!%s        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           10                                               ; Check the service every 10 minutes under normal conditions
        normal_check_interval           3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1
}
"""
release_template_service="""
define service{
        use                             navigos_tcp_service
        host_name                       rancher-agent
        service_description             deployments.%s        check_command                   check_kube_deployments_v2!%s        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 1 minute under normal conditions
        register                        1
}
"""
staging_template_service="""
define service{
        use                             local-service,navigos_service_backend
        host_name                       rancher-agent
        service_description             deployments.%s        check_command                   check_kube_deployments_v2!%s        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           10                                               ; Check the service every 10 minutes under normal conditions
        normal_check_interval           3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour                                                    
        notifications_enabled           0                                               
        register                        1
}
"""
production_path_template_output= "../../production/objects/navigosGroup/BackendService/kube_deployments.cfg"
release_path_template_output= "../../release/objects/NavigosReleaseServer/BackendService/kube_deployments.cfg"
staging_path_template_output= "../../staging/objects/NavigosGroup/BackendService/kube_deployments.cfg"

def generate_service_kubernetes_template(path_nagios_output, template_service, kuber_healthcheck_off):
  file = open("svc_getPortKube.log", "r")
  for ag in file:
    ag=ag.replace("\n","")
    print ("ag:", ag, "| check in list: ", ag not in kuber_healthcheck_off)
    if ag not in kuber_healthcheck_off and "test" not in ag and "cattle" not in ag and "ingress-nginx" not in ag:
      service = template_service % (ag, ag)
      # file_svc.writelines(service)

  file.close()

generate_service_kubernetes_template(release_path_template_output, release_template_service, release_kuber_healthcheck_off)