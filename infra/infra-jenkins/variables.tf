# provider
variable "provider_region" {
  type = string
}

# network
variable "jenkins_vpc" {
  type = string
}
variable "jenkins_subnet" {
  type = string
}
variable "jenkins_subnet_zone" {
  type = string
}
variable "jenkins_route_range" {
  type = string
}

# firewall
variable "https_ingress_from_port" {
  type = number
}
variable "https_ingress_to_port" {
  type = number
}
variable "https_ingress_protocol" {
  type = string
}
variable "https_ingress_ip_range" {
  type = string
}
variable "https_egress_from_port" {
  type = number
}
variable "https_egress_to_port" {
  type = number
}
variable "https_egress_protocol" {
  type = string
}
variable "https_egress_ip_range" {
  type = string
}

# virtual machine
variable "instance_tag_name" {
  type = string
}
variable "ami_latest_image" {
  type = bool
}
variable "ami_owner" {
  type = string
}
variable "ami_filter_name" {
  type = string
}
variable "ami_name_value" {
  type = string
}
variable "ami_filter_state" {
  type = string
}
variable "ami_state_value" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "elastic_ip" {
  type = string
}

variable "instance_volume_size" {
  type = number
}

variable "instance_volume_type" {
  type = string
}
