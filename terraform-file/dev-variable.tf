variable "mykey" {}
variable "ubuntu_ami" {
  description = "ubuntu Linux"
}
variable "region" {}
variable "instance_type" {}
variable "devops_server_secgr" {}
variable "dev-server-ports" {
  type = list(number)
  description = "dev-server-sec-gr-inbound-rules"
}
variable "dockerservertag" {}
variable "jfrogservertag" {}
variable "jenkinsservertag" {}
variable "jenkinsdockerservertag" {}