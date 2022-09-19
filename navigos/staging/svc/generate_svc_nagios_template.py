import sys

production_kuber_healthcheck_off= ["job-sync/job-sync-nodeport","micro-navi-cms/micro-navi-cms-nodeport"]
release_kuber_healthcheck_off= ["job-sync/job-sync-nodeport","micro-navi-cms/micro-navi-cms-nodeport","	release-vnw/release-vnw-nodeport","release-vnw/release-vnw-nodeport"]
staging_kuber_healthcheck_off= ["kube.check_kube_nodes", "recommend-courses/recommend-courses-nodeport","nexus/nexus-nodeport","kyna-jobseekers/kyna-jobseekers-nodeport","default/sample-app"]

production_template_service="""
define service{
        use                             navigos_tcp_service
        host_name                       rancher-agent
        service_description             svc.%s-port[%s]
        check_command                   check_tcp_vip!10.122.5.113!%s!2!5!
        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 1 minute under normal conditions
        register                        1                               
}
"""
release_template_service="""
define service{
        use                             navigos_tcp_service
        host_name                       rancher-agent
        service_description             svc.%s-port[%s]
        check_command                   check_tcp_vip!172.16.5.151!%s!2!5!
        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
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
        use                             navigos_tcp_service
        host_name                       rancher-agent
        service_description             svc.%s-port[%s]
        check_command                   check_tcp_vip!172.16.4.181!%s!2!5!
        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour
        # contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 1 minute under normal conditions
        register                        1                               
}
"""
production_path_template_output= "../../production/objects/navigosGroup/BackendService/servicePortKubenetes.cfg"
release_path_template_output= "../../release/objects/NavigosReleaseServer/BackendService/servicePortKubenetes.cfg"
staging_path_template_output= "./servicePortKubenetes.cfg"

def generate_service_kubernetes_template(path_nagios_output, template_service, kuber_healthcheck_off):
  file = open("svc_getPortKube.log", "r")
  file_checkip = open("getPortKubeExist.log", "r")

  file_removeservice = open("removeService.log", "r")
  servicename=file_removeservice.read().splitlines()

  file_svc = open(path_nagios_output, "w+")

  arr_port_monitor = []
  for x in file_checkip:
      temp = x.split("!")[2]
      arr_port_monitor.append(temp)
  for x in file:
    x= x.strip()
    ag= x.split(" ")
    temp= ag[0].replace("-nodeport", "")
    if temp not in servicename:
      if ag[0] not in kuber_healthcheck_off and ag[1] not in arr_port_monitor and "test" not in ag[0]:
        service = template_service % (ag[0],ag[1],ag[1])
        file_svc.writelines(service)

  file.close()
  file_checkip.close()
  file_removeservice.close()
  file_svc.close()

# env = sys.argv[1]
# if env == "production":
#   generate_service_kubernetes_template(production_path_template_output, production_template_service, production_kuber_healthcheck_off)
# if env == "release":
#   generate_service_kubernetes_template(release_path_template_output, release_template_service, release_kuber_healthcheck_off)
# if env == "staging":
#   generate_service_kubernetes_template(staging_path_template_output, staging_template_service, staging_kuber_healthcheck_off)

generate_service_kubernetes_template(staging_path_template_output, staging_template_service, staging_kuber_healthcheck_off)
