provider "aws" {
	region = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}


resource "aws_instance" "default" {
  ami = var.ami
  instance_type = var.instance_type
  count = 1
  
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "mysg" {
  
  description = "security group for private network access"
  vpc_id      = "${data.aws_vpc.default.id}"

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
    #cidr_blocks = ["0.0.0.0./0"]

  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# 	data "aws_instance" "default" {
#   instance_id = aws_instance.default.id
# }

# data "aws_network_interface" "default" {
#   id = data.aws_instance.default.network_interface_id
# }
# data "aws_security_group" "default" {
#   id = aws_security_group.default.id
# }
}
