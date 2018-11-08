#!/bin/bash

MASTER_IP=`terraform output --json | jq -r ".k8s_master_public_ip.value"`

cat > hosts <<EOL
[masters]
master ansible_host=${MASTER_IP} ansible_user=root

[workers]
EOL

WORKER_NUMBER=1
for ip in `terraform output --json | jq -r ".nodes_public_ip.value[]"`; do 
	echo "worker${WORKER_NUMBER} ansible_host=${ip} ansible_user=root" >> hosts
	let WORKER_NUMBER=${WORKER_NUMBER}+1
done
