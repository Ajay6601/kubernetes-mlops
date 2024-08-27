data "aws_ami" "latest_csye7125_ami_id" {
  most_recent = var.ami_latest_image
  owners      = [var.ami_owner]

  filter {
    name   = var.ami_filter_name
    values = [var.ami_name_value]
  }

  filter {
    name   = var.ami_filter_state
    values = [var.ami_state_value]
  }
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.latest_csye7125_ami_id.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.jenkins_subnet.id
  security_groups = [
    aws_security_group.allow_https.id
  ]
  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = var.instance_volume_type
  }

  tags = {
    Name = var.instance_tag_name
  }
}

data "aws_eip" "existing_eip" {
  public_ip = var.elastic_ip
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = data.aws_eip.existing_eip.id
}
