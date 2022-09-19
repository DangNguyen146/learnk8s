##### Monitor service port in kubenetes

#### Env: staging, release, production

### generate script for nagios
 - Get all port and grep if not exist in nagios then add monitoring service.
kubectl get svc --all-namespaces -o go-template='range .items{{ $save := . }}range.spec.portsif .nodePort$save.metadata.namespace"/"$save.metadata.name" - ".name": ".nodePort"\n"
api-gateway/api-gateway - tcp-8083: 32684
attached-resume-preview/attached-resume-preview-nodeport - tcp-5000: 32447
attached-resume/attached-resume-preview-nodeport - attached-resume: 32164
attached-resume/attached-resume-validation-nodeport - 8000tcp1: 31831
attached-resumes-validation/attached-resumes-validation - tcp-8000: 30640
 
### file: kube_svc.cfg
 
define service
{ 
    service_description attached-resumes-validation/attached-resumes-validation
    use navigos_tcp_service
    host_name rancher-agent
    check_command check_tcp_vip!10.122.5.113!30640!2!5! 
    max_check_attempts 3 ; Re-check the service up to 4 times in order to determine its final (hard) state 
    normal_check_interval 1 ; Check the service every 10 minutes under normal conditions 
    retry_check_interval 3 ; Re-check the service every two minutes until a hard state can be determined 
    notification_interval 10 ; Re-notify about service problems every hour 
    # contact_groups System_Admins,System_Admins_SMS,nagios_newdc 
    normal_check_interval 1 ; Check the service every 1 minute under normal conditions register 1 
}

### Step
cat ~/.kube/staging.conf
kubectl --kubeconfig ~/.kube/staging.conf get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}'



