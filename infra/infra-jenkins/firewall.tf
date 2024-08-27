resource "aws_security_group" "allow_https" {
  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = var.https_ingress_from_port
    to_port     = var.https_ingress_to_port
    protocol    = var.https_ingress_protocol
    cidr_blocks = [var.https_ingress_ip_range]
  }

  egress {
    from_port   = var.https_egress_from_port
    to_port     = var.https_egress_to_port
    protocol    = var.https_egress_protocol
    cidr_blocks = [var.https_egress_ip_range]
  }

  tags = {
    Name = var.instance_tag_name
  }
}
