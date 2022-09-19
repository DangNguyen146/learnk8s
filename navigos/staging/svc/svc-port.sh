#!/bin/bash
# merge git
BRANCH='master'
git reset --hard origin/$BRANCH
git clean -xdf
git pull origin $BRANCH


#sync


> "../../production/objects/navigosGroup/BackendService/servicePortKubenetes.cfg"
> "../../release/objects/NavigosReleaseServer/BackendService/servicePortKubenetes.cfg"
> "../../staging/objects/NavigosGroup/BackendService/servicePortKubenetes.cfg"

echo "____________________________PRODUCTION__________________________________________"
echo "____________________________PRODUCTION__________________________________________"
echo "____________________________PRODUCTION__________________________________________"
rm -rf svc_getPortKube.log
rm -rf getPortKubeExist.log
/usr/local/bin/kubectl get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' > svc_getPortKube.log
echo ">>>>svc_getPortKube.log<<<<"
cat svc_getPortKube.log
/usr/bin/find ../../production/objects -type f -exec /usr/bin/cat {} +| grep 'check_tcp_vip!' | grep "^[^#;]" | awk '{print $2;}' > getPortKubeExist.log
echo ">>>>getPortKubeExist.log<<<<"
cat getPortKubeExist.log
/bin/python3 generate_svc_nagios_template.py production
echo "____________________________/bin/python3 generate_svc_nagios_template.py production__________________________________________"
cat ../../production/objects/navigosGroup/BackendService/servicePortKubenetes.cfg

echo "____________________________STAGING__________________________________________"
echo "____________________________STAGING__________________________________________"
echo "____________________________STAGING__________________________________________"
# staging
rm -rf svc_getPortKube.log
rm -rf getPortKubeExist.log
/usr/local/bin/kubectl --kubeconfig ~/.kube/._________________staging.conf________ get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' > svc_getPortKube.log
echo ">>>>svc_getPortKube.log<<<<"
cat svc_getPortKube.log
/usr/bin/find ../../staging/objects -type f -exec /usr/bin/cat {} +| grep 'check_tcp_vip!' | grep "^[^#;]" | awk '{print $2;}' > getPortKubeExist.log
echo ">>>>getPortKubeExist.log<<<<"
cat getPortKubeExist.log
/bin/python3 generate_svc_nagios_template.py staging
echo "____________________________/bin/python3 generate_svc_nagios_template.py staging__________________________________________"
cat ../../staging/objects/NavigosGroup/BackendService/servicePortKubenetes.cfg


echo "____________________________RELEASE__________________________________________"
echo "____________________________RELEASE__________________________________________"
echo "____________________________RELEASE__________________________________________"
rm -rf svc_getPortKube.log
rm -rf getPortKubeExist.log
/usr/local/bin/kubectl --kubeconfig ~/.kube/._________________release.conf________ get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' > svc_getPortKube.log
echo ">>>>svc_getPortKube.log<<<<"
cat svc_getPortKube.log
/usr/bin/find ../../release/objects -type f -exec /usr/bin/cat {} +| grep 'check_tcp_vip!' | grep "^[^#;]" | awk '{print $2;}' > getPortKubeExist.log
echo ">>>>getPortKubeExist.log<<<<"
cat getPortKubeExist.log
/bin/python3 generate_svc_nagios_template.py release 
echo "____________________________/bin/python3 generate_svc_nagios_template.py release__________________________________________"
cat ../../release/objects/NavigosReleaseServer/BackendService/servicePortKubenetes.cfg


# sync source to git
date=`date +%Y%m%d_%H%M%S`

(
echo "cd /data/www/Nagios"
cd /data/www/Nagios
git add .
git commit -m "generate lb-svc template $date"
git push origin master
echo "complete $date"
)



kubectl --kubeconfig ~/.kube/staging.conf get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' > svc_getPortKube.log


kubectl get deployment  --all-namespaces --kubeconfig ~/.kube/staging.conf  | awk '{ print $1, "/", $2, $3 }' | grep "0/0" | sed -e 's: / :/:g' | awk '{  print $1}' > removeService.log