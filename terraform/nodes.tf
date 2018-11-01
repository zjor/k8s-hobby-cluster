resource "scaleway_ip" "k8s_node_ip" {
  count = "${var.nodes}"
}

resource "scaleway_server" "k8s_node" {
  count          = "${var.nodes}"
  name           = "node-${count.index + 1}"
  image          = "${data.scaleway_image.centos.id}"
  type           = "${var.server_type_node}"
  public_ip      = "${element(scaleway_ip.k8s_node_ip.*.ip, count.index)}"
  security_group = "${scaleway_security_group.node_security_group.id}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file(var.private_key)}"
  }
}
