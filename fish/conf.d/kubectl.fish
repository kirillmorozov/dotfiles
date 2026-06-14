#!/usr/bin/env fish

# Oh-My-Zsh kubectl plugin abbreviations.
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh

abbr -a k -- kubectl

# apply
abbr -a kaf -- 'kubectl apply -f'
abbr -a kapk -- 'kubectl apply -k'

# config
abbr -a kccc -- 'kubectl config current-context'
abbr -a kcdc -- 'kubectl config delete-context'
abbr -a kcgc -- 'kubectl config get-contexts'
abbr -a kcn -- 'kubectl config set-context --current --namespace'
abbr -a kcsc -- 'kubectl config set-context'
abbr -a kcuc -- 'kubectl config use-context'

# cp
abbr -a kcp -- 'kubectl cp'

# delete
abbr -a kdel -- 'kubectl delete'
abbr -a kdelcj -- 'kubectl delete cronjob'
abbr -a kdelcm -- 'kubectl delete configmap'
abbr -a kdeld -- 'kubectl delete deployment'
abbr -a kdelds -- 'kubectl delete daemonset'
abbr -a kdelf -- 'kubectl delete -f'
abbr -a kdeli -- 'kubectl delete ingress'
abbr -a kdelj -- 'kubectl delete job'
abbr -a kdelk -- 'kubectl delete -k'
abbr -a kdelno -- 'kubectl delete node'
abbr -a kdelns -- 'kubectl delete namespace'
abbr -a kdelp -- 'kubectl delete pods'
abbr -a kdelpvc -- 'kubectl delete pvc'
abbr -a kdels -- 'kubectl delete svc'
abbr -a kdelsa -- 'kubectl delete sa'
abbr -a kdelsec -- 'kubectl delete secret'
abbr -a kdelss -- 'kubectl delete statefulset'

# get
abbr -a kga -- 'kubectl get all'
abbr -a kgaa -- 'kubectl get all --all-namespaces'
abbr -a kgcj -- 'kubectl get cronjob'
abbr -a kgcm -- 'kubectl get configmaps'
abbr -a kgcma -- 'kubectl get configmaps --all-namespaces'
abbr -a kgd -- 'kubectl get deployment'
abbr -a kgda -- 'kubectl get deployment --all-namespaces'
abbr -a kgds -- 'kubectl get daemonset'
abbr -a kgdsa -- 'kubectl get daemonset --all-namespaces'
abbr -a kgdsw -- 'kubectl get daemonset --watch'
abbr -a kgdw -- 'kubectl get deployment --watch'
abbr -a kgdwide -- 'kubectl get deployment -o wide'
abbr -a kge -- 'kubectl get events --sort-by=".lastTimestamp"'
abbr -a kgew -- 'kubectl get events --sort-by=".lastTimestamp" --watch'
abbr -a kgi -- 'kubectl get ingress'
abbr -a kgia -- 'kubectl get ingress --all-namespaces'
abbr -a kgj -- 'kubectl get job'
abbr -a kgno -- 'kubectl get nodes'
abbr -a kgnosl -- 'kubectl get nodes --show-labels'
abbr -a kgns -- 'kubectl get namespaces'
abbr -a kgp -- 'kubectl get pods'
abbr -a kgpa -- 'kubectl get pods --all-namespaces'
abbr -a kgpall -- 'kubectl get pods --all-namespaces -o wide'
abbr -a kgpl -- 'kubectl get pods -l'
abbr -a kgpn -- 'kubectl get pods -n'
abbr -a kgpsl -- 'kubectl get pods --show-labels'
abbr -a kgpvc -- 'kubectl get pvc'
abbr -a kgpvca -- 'kubectl get pvc --all-namespaces'
abbr -a kgpvcw -- 'kubectl get pvc --watch'
abbr -a kgpw -- 'kubectl get pods --watch'
abbr -a kgpwide -- 'kubectl get pods -o wide'
abbr -a kgrs -- 'kubectl get replicaset'
abbr -a kgs -- 'kubectl get svc'
abbr -a kgsa -- 'kubectl get svc --all-namespaces'
abbr -a kgsec -- 'kubectl get secret'
abbr -a kgseca -- 'kubectl get secret --all-namespaces'
abbr -a kgss -- 'kubectl get statefulset'
abbr -a kgssa -- 'kubectl get statefulset --all-namespaces'
abbr -a kgssw -- 'kubectl get statefulset --watch'
abbr -a kgsswide -- 'kubectl get statefulset -o wide'
abbr -a kgsw -- 'kubectl get svc --watch'
abbr -a kgswide -- 'kubectl get svc -o wide'

# describe
abbr -a kdcj -- 'kubectl describe cronjob'
abbr -a kdcm -- 'kubectl describe configmap'
abbr -a kdd -- 'kubectl describe deployment'
abbr -a kdds -- 'kubectl describe daemonset'
abbr -a kdi -- 'kubectl describe ingress'
abbr -a kdj -- 'kubectl describe job'
abbr -a kdno -- 'kubectl describe node'
abbr -a kdns -- 'kubectl describe namespace'
abbr -a kdp -- 'kubectl describe pods'
abbr -a kdpvc -- 'kubectl describe pvc'
abbr -a kdrs -- 'kubectl describe replicaset'
abbr -a kds -- 'kubectl describe svc'
abbr -a kdsa -- 'kubectl describe sa'
abbr -a kdsec -- 'kubectl describe secret'
abbr -a kdss -- 'kubectl describe statefulset'

# edit
abbr -a kecj -- 'kubectl edit cronjob'
abbr -a kecm -- 'kubectl edit configmap'
abbr -a ked -- 'kubectl edit deployment'
abbr -a keds -- 'kubectl edit daemonset'
abbr -a kei -- 'kubectl edit ingress'
abbr -a kej -- 'kubectl edit job'
abbr -a keno -- 'kubectl edit node'
abbr -a kens -- 'kubectl edit namespace'
abbr -a kep -- 'kubectl edit pods'
abbr -a kepvc -- 'kubectl edit pvc'
abbr -a kers -- 'kubectl edit replicaset'
abbr -a kes -- 'kubectl edit svc'
abbr -a kess -- 'kubectl edit statefulset'

# exec
abbr -a keti -- 'kubectl exec -t -i'

# logs
abbr -a kl -- 'kubectl logs'
abbr -a kl1h -- 'kubectl logs --since 1h'
abbr -a kl1m -- 'kubectl logs --since 1m'
abbr -a kl1s -- 'kubectl logs --since 1s'
abbr -a klf -- 'kubectl logs -f'
abbr -a klf1h -- 'kubectl logs --since 1h -f'
abbr -a klf1m -- 'kubectl logs --since 1m -f'
abbr -a klf1s -- 'kubectl logs --since 1s -f'

# port-forward
abbr -a kpf -- 'kubectl port-forward'

# rollout
abbr -a krh -- 'kubectl rollout history'
abbr -a krrd -- 'kubectl rollout restart deployment'
abbr -a krrss -- 'kubectl rollout restart statefulset'
abbr -a krsd -- 'kubectl rollout status deployment'
abbr -a krsss -- 'kubectl rollout status statefulset'
abbr -a kru -- 'kubectl rollout undo'

# scale
abbr -a ksd -- 'kubectl scale deployment'
abbr -a ksss -- 'kubectl scale statefulset'
