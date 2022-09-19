/Users/dangnk/dangnk/navigos/Nagios/sync_script.sh
>svc.log
>test.log
kubectl --kubeconfig ~/.kube/staging.conf get svc --all-namespaces -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' >> svc.log
find /Users/dangnk/dangnk/navigos/Nagios/staging/objects/ -type f -exec cat {} +| grep 'check_tcp_vip!' | grep "^[^#;]" | awk '{print $2;}' >> test.log
python3 temp.py
python3 gen_svc.py

# find | grep "\Users\dangnk\dangnk\navigos\test\navigos\staging\.cfg"


grep -r --exclude-dir=. /Users/dangnk/dangnk/navigos/Nagios/staging/objects/ | grep "check_tcp_vip" >> test.cfg


kubectl get deployment  --all-namespaces --kubeconfig ~/.kube/staging.conf > svc_getPortKube.log
kubectl get deployment  --all-namespaces --kubeconfig ~/.kube/staging.conf -o go-template='{{range .items}}{{ $save := . }}{{range.spec.ports}}{{if .nodePort}}{{$save.metadata.namespace}}{{"/"}}{{$save.metadata.name}}{{" - "}}{{.name}}{{": "}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}' | awk '{print $1, $4;}' > svc_getPortKube.log

kubectl get deployment  --all-namespaces --kubeconfig ~/.kube/staging.conf | awk 'NR>1 { split($3,a,"/"); if(a[1]!="0") print $1;} ;' > svc_getPortKube.log

