kubectl --kubeconfig ~/.kube/staging.conf  get namespace| awk 'NR>1 {print $1;}'  > svc_getPortKube.log


kubectl --kubeconfig ~/.kube/staging.conf  get namespace