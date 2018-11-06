output "k8s_master_public_ip" {
  value = "${scaleway_ip.k8s_master_ip.0.ip}"
}

output "nodes_public_ip" {
  value = "${concat(scaleway_server.k8s_node.*.name, scaleway_server.k8s_node.*.public_ip)}"
}