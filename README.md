# Overview

This repo will guide you through creation of k8s cluster on [Scaleway](https://scaleway.com).

## Provisioning resources

`terraform init`

`terraform plan`

`terraform apply`

`terraform output`

## Configuring Ansible

1. Create an inventory file

```
[masters]
master ansible_host=<master_ip> ansible_user=root

[workers]
worker1 ansible_host=<node1_ip> ansible_user=root
worker2 ansible_host=<node2_ip> ansible_user=root
```

2. Connectivity check: `ansible all -i hosts -m ping`


## References
[Provisioning inspiration](https://github.com/stefanprodan/k8s-scw-baremetal)

[Ansible playbooks inspiration](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-1-10-cluster-using-kubeadm-on-centos-7)