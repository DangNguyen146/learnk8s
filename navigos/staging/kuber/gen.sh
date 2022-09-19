curl -I -u tuonghv:11100a21d7433a9aa0e7a836460665df8c --resolve staging-jenkins.vietnamworks.com:172.16.4.25:8080 "http://staging-jenkins.vietnamworks.com/job/VNW-Staging/job/pipeline/job/Command/job/online-system/job/nagios_deploy/build?token=zStFCXgSFRTE"
curl -I -u tuonghv:11100a21d7433a9aa0e7a836460665df8c "http://staging-jenkins.vietnamworks.com/job/VNW-Staging/job/pipeline/job/Command/job/online-system/job/nagios_deploy/build?token=zStFCXgSFRTE"

$ARG1$ = jenkinsbackend $ARG2$=staging-jenkins.vietnamworks.com $ARG3$=172.16.4.25:8080
$USER1$/check_http_curl_resolve.sh $ARG1$ $ARG2$ $ARG3$

SERVICE=jenkinsbackend
HOST_NAME=staging-jenkins.vietnamworks.com
HOST=172.16.4.25:8080