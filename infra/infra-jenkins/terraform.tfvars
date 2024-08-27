# provider
provider_region = "us-east-1"

# network
jenkins_vpc         = "10.0.0.0/16"
jenkins_subnet      = "10.0.1.0/24"
jenkins_subnet_zone = "us-east-1a"
jenkins_route_range = "0.0.0.0/0"

# firewall
https_ingress_from_port = 443
https_ingress_to_port   = 443
https_ingress_protocol  = "tcp"
https_ingress_ip_range  = "0.0.0.0/0"
https_egress_from_port  = 0
https_egress_to_port    = 0
https_egress_protocol   = "-1"
https_egress_ip_range   = "0.0.0.0/0"

# virtual machine
instance_tag_name    = "jenkins_instance"
ami_latest_image     = true
ami_owner            = "self"
ami_filter_name      = "name"
ami_name_value       = "csye7125-*"
ami_filter_state     = "state"
ami_state_value      = "available"
instance_type        = "t2.medium"
elastic_ip           = "34.232.103.26"
instance_volume_size = 30
instance_volume_type = "gp3"
