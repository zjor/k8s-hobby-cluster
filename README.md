# Overview

This repo will guide you through creation of k8s cluster on [Scaleway](https://scaleway.com).

## Provisioning resources

### Scaleway credentials

Before running the project you'll have to create an access token for Terraform to connect to the Scaleway API

Now retrieve the `<ORGANIZATION_ID>` using your `<ACCESS-TOKEN>` from `/organizations` API endpoint:

```bash
$ curl https://account.scaleway.com/organizations -H "X-Auth-Token: <ACCESS-TOKEN>"
```

Sample output (excerpt with organization ID):
```bash
"organizations": [{"id": "xxxxxxxxxxxxx", "name": "Organization Name"}],
```

Using the token and your organization ID, create two environment variables:

```bash
$ export SCALEWAY_ORGANIZATION="<ORGANIZATION_ID>"
$ export SCALEWAY_TOKEN="<ACCESS-TOKEN>"
```

### Provisioning

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

[Scenario description](https://www.howtoforge.com/tutorial/centos-kubernetes-docker-cluster/)
