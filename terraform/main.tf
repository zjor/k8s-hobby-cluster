provider "scaleway" {
  region  = "${var.region}"
}

data "scaleway_image" "centos" {
  architecture = "${var.arch}"
  name         = "CentOS 7.4"
}