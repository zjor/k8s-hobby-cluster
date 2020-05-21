# Common routine optimization playbooks

## get-pods

`ansible-playbook get-pods.yml -e "k8s_namespace=rentic"`

## delete-pod

`ansible-playbook delete-pod.yml -e "k8s_namespace=iscream" -e "app_label=iscream-generator"`