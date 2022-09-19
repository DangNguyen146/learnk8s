
staging_kuber_healthcheck_off= ["attached-resume-preview"]

staging_template_header="""
###############################################################################
# vHP01.CFG - OBJECT CONFIG FILE FOR MONITORING vHP01 DATABASE SERVER
# Author: Tuonghv
# Created: Aug 24, 2022
# Edited: Aug 24, 2022
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
        use                             navigos_tcp_service
        host_name                       rancher-agent
        service_description             %s
        check_command                   check_tcp_vip!172.16.5.43!%s!2!5!
        max_check_attempts              3                                               ; Re-check the service up to 4 times in order to determine its final (hard) state
        normal_check_interval           1                                               ; Check the service every 10 minutes under normal conditions
        retry_check_interval            3                                               ; Re-check the service every two minutes until a hard state can be determined
        notification_interval           10                                              ; Re-notify about service problems every hour
        contact_groups                  System_Admins,System_Admins_SMS,nagios_newdc
        normal_check_interval           1                                               ; Check the service every 1 minute under normal conditions
        register                        1                               
}
"""
# staging_path_template_output= "../../staging/objects/NavigosGroup/Staging_Rancher/servicePortKubenetes.cfg"
staging_path_template_output= "./servicePortKubenetes.cfg"

def generate_service_kubernetes_template(path_nagios_output, template_header, template_service, kuber_healthcheck_off):
  file = open("svc.log", "r")
  file_checkip = open("test.log", "r")
  file_svc = open(path_nagios_output, "w+")
  file_svc.writelines(template_header)

  arr_port_monitor= []
  for x in file_checkip:
      x= x.split("!")[2]
      arr_port_monitor.append(x)

  for x in file:
    x= x.strip()
    ag= x.split(" ")
    if ag[0] not in kuber_healthcheck_off and ag[1] not in arr_port_monitor:
      service = staging_template_service % (ag[0],ag[1])
      file_svc.writelines(service)

  file.close()
  file_checkip.close()
  file_svc.close()

generate_service_kubernetes_template(staging_path_template_output,staging_template_header, staging_template_service, staging_kuber_healthcheck_off)