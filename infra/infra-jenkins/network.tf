resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.jenkins_vpc
}

resource "aws_subnet" "jenkins_subnet" {
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = var.jenkins_subnet
  availability_zone = var.jenkins_subnet_zone
}

resource "aws_internet_gateway" "jenkins_vpc_gw" {
  vpc_id = aws_vpc.jenkins_vpc.id
}

resource "aws_route_table" "jenkins_subnet_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = var.jenkins_route_range
    gateway_id = aws_internet_gateway.jenkins_vpc_gw.id
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_subnet_rt.id
}
