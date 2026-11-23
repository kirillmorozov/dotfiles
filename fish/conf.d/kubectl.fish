#!/usr/bin/env fish

# Oh-My-Zsh kubectl plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh

abbr -a k --description='run kubectl' -- kubectl

# apply
abbr -a kaf --description='apply manifest file' -- 'kubectl apply -f'
abbr -a kapk --description='apply kustomization' -- 'kubectl apply -k'

# config
abbr -a kccc --description='show current context' -- 'kubectl config current-context'
abbr -a kcdc --description='delete context' -- 'kubectl config delete-context'
abbr -a kcgc --description='list contexts' -- 'kubectl config get-contexts'
abbr -a kcn --description='set current namespace' -- 'kubectl config set-context --current --namespace'
abbr -a kcsc --description='set context' -- 'kubectl config set-context'
abbr -a kcuc --description='use context' -- 'kubectl config use-context'

# cp
abbr -a kcp --description='copy files to or from pod' -- 'kubectl cp'

# delete
abbr -a kdel --description='delete resource' -- 'kubectl delete'
abbr -a kdelcj --description='delete cronjob' -- 'kubectl delete cronjob'
abbr -a kdelcm --description='delete configmap' -- 'kubectl delete configmap'
abbr -a kdeld --description='delete deployment' -- 'kubectl delete deployment'
abbr -a kdelds --description='delete daemonset' -- 'kubectl delete daemonset'
abbr -a kdelf --description='delete manifest file resources' -- 'kubectl delete -f'
abbr -a kdeli --description='delete ingress' -- 'kubectl delete ingress'
abbr -a kdelj --description='delete job' -- 'kubectl delete job'
abbr -a kdelk --description='delete kustomization resources' -- 'kubectl delete -k'
abbr -a kdelno --description='delete node' -- 'kubectl delete node'
abbr -a kdelns --description='delete namespace' -- 'kubectl delete namespace'
abbr -a kdelp --description='delete pods' -- 'kubectl delete pods'
abbr -a kdelpvc --description='delete persistent volume claim' -- 'kubectl delete pvc'
abbr -a kdels --description='delete service' -- 'kubectl delete svc'
abbr -a kdelsa --description='delete service account' -- 'kubectl delete sa'
abbr -a kdelsec --description='delete secret' -- 'kubectl delete secret'
abbr -a kdelss --description='delete statefulset' -- 'kubectl delete statefulset'

# get
abbr -a kga --description='list all resources' -- 'kubectl get all'
abbr -a kgaa --description='list all resources in all namespaces' -- 'kubectl get all --all-namespaces'
abbr -a kgcj --description='list cronjobs' -- 'kubectl get cronjob'
abbr -a kgcm --description='list configmaps' -- 'kubectl get configmaps'
abbr -a kgcma --description='list configmaps in all namespaces' -- 'kubectl get configmaps --all-namespaces'
abbr -a kgd --description='list deployments' -- 'kubectl get deployment'
abbr -a kgda --description='list deployments in all namespaces' -- 'kubectl get deployment --all-namespaces'
abbr -a kgds --description='list daemonsets' -- 'kubectl get daemonset'
abbr -a kgdsa --description='list daemonsets in all namespaces' -- 'kubectl get daemonset --all-namespaces'
abbr -a kgdsw --description='watch daemonsets' -- 'kubectl get daemonset --watch'
abbr -a kgdw --description='watch deployments' -- 'kubectl get deployment --watch'
abbr -a kgdwide --description='list deployments in wide format' -- 'kubectl get deployment -o wide'
abbr -a kge --description='list events by timestamp' -- 'kubectl get events --sort-by=".lastTimestamp"'
abbr -a kgew --description='watch events by timestamp' -- 'kubectl get events --sort-by=".lastTimestamp" --watch'
abbr -a kgi --description='list ingresses' -- 'kubectl get ingress'
abbr -a kgia --description='list ingresses in all namespaces' -- 'kubectl get ingress --all-namespaces'
abbr -a kgj --description='list jobs' -- 'kubectl get job'
abbr -a kgno --description='list nodes' -- 'kubectl get nodes'
abbr -a kgnosl --description='list nodes with labels' -- 'kubectl get nodes --show-labels'
abbr -a kgns --description='list namespaces' -- 'kubectl get namespaces'
abbr -a kgp --description='list pods' -- 'kubectl get pods'
abbr -a kgpa --description='list pods in all namespaces' -- 'kubectl get pods --all-namespaces'
abbr -a kgpall --description='list pods in all namespaces wide' -- 'kubectl get pods --all-namespaces -o wide'
abbr -a kgpl --description='list pods by label selector' -- 'kubectl get pods -l'
abbr -a kgpn --description='list pods in namespace' -- 'kubectl get pods -n'
abbr -a kgpsl --description='list pods with labels' -- 'kubectl get pods --show-labels'
abbr -a kgpvc --description='list persistent volume claims' -- 'kubectl get pvc'
abbr -a kgpvca --description='list persistent volume claims in all namespaces' -- 'kubectl get pvc --all-namespaces'
abbr -a kgpvcw --description='watch persistent volume claims' -- 'kubectl get pvc --watch'
abbr -a kgpw --description='watch pods' -- 'kubectl get pods --watch'
abbr -a kgpwide --description='list pods in wide format' -- 'kubectl get pods -o wide'
abbr -a kgrs --description='list replicasets' -- 'kubectl get replicaset'
abbr -a kgs --description='list services' -- 'kubectl get svc'
abbr -a kgsa --description='list services in all namespaces' -- 'kubectl get svc --all-namespaces'
abbr -a kgsec --description='list secrets' -- 'kubectl get secret'
abbr -a kgseca --description='list secrets in all namespaces' -- 'kubectl get secret --all-namespaces'
abbr -a kgss --description='list statefulsets' -- 'kubectl get statefulset'
abbr -a kgssa --description='list statefulsets in all namespaces' -- 'kubectl get statefulset --all-namespaces'
abbr -a kgssw --description='watch statefulsets' -- 'kubectl get statefulset --watch'
abbr -a kgsswide --description='list statefulsets in wide format' -- 'kubectl get statefulset -o wide'
abbr -a kgsw --description='watch services' -- 'kubectl get svc --watch'
abbr -a kgswide --description='list services in wide format' -- 'kubectl get svc -o wide'

# describe
abbr -a kdcj --description='describe cronjob' -- 'kubectl describe cronjob'
abbr -a kdcm --description='describe configmap' -- 'kubectl describe configmap'
abbr -a kdd --description='describe deployment' -- 'kubectl describe deployment'
abbr -a kdds --description='describe daemonset' -- 'kubectl describe daemonset'
abbr -a kdi --description='describe ingress' -- 'kubectl describe ingress'
abbr -a kdj --description='describe job' -- 'kubectl describe job'
abbr -a kdno --description='describe node' -- 'kubectl describe node'
abbr -a kdns --description='describe namespace' -- 'kubectl describe namespace'
abbr -a kdp --description='describe pods' -- 'kubectl describe pods'
abbr -a kdpvc --description='describe persistent volume claim' -- 'kubectl describe pvc'
abbr -a kdrs --description='describe replicaset' -- 'kubectl describe replicaset'
abbr -a kds --description='describe service' -- 'kubectl describe svc'
abbr -a kdsa --description='describe service account' -- 'kubectl describe sa'
abbr -a kdsec --description='describe secret' -- 'kubectl describe secret'
abbr -a kdss --description='describe statefulset' -- 'kubectl describe statefulset'

# edit
abbr -a kecj --description='edit cronjob' -- 'kubectl edit cronjob'
abbr -a kecm --description='edit configmap' -- 'kubectl edit configmap'
abbr -a ked --description='edit deployment' -- 'kubectl edit deployment'
abbr -a keds --description='edit daemonset' -- 'kubectl edit daemonset'
abbr -a kei --description='edit ingress' -- 'kubectl edit ingress'
abbr -a kej --description='edit job' -- 'kubectl edit job'
abbr -a keno --description='edit node' -- 'kubectl edit node'
abbr -a kens --description='edit namespace' -- 'kubectl edit namespace'
abbr -a kep --description='edit pods' -- 'kubectl edit pods'
abbr -a kepvc --description='edit persistent volume claim' -- 'kubectl edit pvc'
abbr -a kers --description='edit replicaset' -- 'kubectl edit replicaset'
abbr -a kes --description='edit service' -- 'kubectl edit svc'
abbr -a kess --description='edit statefulset' -- 'kubectl edit statefulset'

# exec
abbr -a keti --description='execute interactive terminal' -- 'kubectl exec -t -i'

# logs
abbr -a kl --description='show logs' -- 'kubectl logs'
abbr -a kl1h --description='show logs from last hour' -- 'kubectl logs --since 1h'
abbr -a kl1m --description='show logs from last minute' -- 'kubectl logs --since 1m'
abbr -a kl1s --description='show logs from last second' -- 'kubectl logs --since 1s'
abbr -a klf --description='follow logs' -- 'kubectl logs -f'
abbr -a klf1h --description='follow logs from last hour' -- 'kubectl logs --since 1h -f'
abbr -a klf1m --description='follow logs from last minute' -- 'kubectl logs --since 1m -f'
abbr -a klf1s --description='follow logs from last second' -- 'kubectl logs --since 1s -f'

# port-forward
abbr -a kpf --description='forward local port to pod' -- 'kubectl port-forward'

# rollout
abbr -a krh --description='show rollout history' -- 'kubectl rollout history'
abbr -a krrd --description='restart deployment rollout' -- 'kubectl rollout restart deployment'
abbr -a krrss --description='restart statefulset rollout' -- 'kubectl rollout restart statefulset'
abbr -a krsd --description='show deployment rollout status' -- 'kubectl rollout status deployment'
abbr -a krsss --description='show statefulset rollout status' -- 'kubectl rollout status statefulset'
abbr -a kru --description='undo rollout' -- 'kubectl rollout undo'

# scale
abbr -a ksd --description='scale deployment' -- 'kubectl scale deployment'
abbr -a ksss --description='scale statefulset' -- 'kubectl scale statefulset'
