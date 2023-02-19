terraform {
backend  "http" {
address = "https://us1-smax.saas.microfocus.com/iac-controller/v1/393740922/terraform/Workspace1/backend"
lock_address = "https://us1-smax.saas.microfocus.com/iac-controller/v1/393740922/terraform/Workspace1/backend/lock"
unlock_address = "https://us1-smax.saas.microfocus.com/iac-controller/v1/393740922/terraform/Workspace1/backend/lock"
lock_method = "POST"
unlock_method ="DELETE"
username = "jean-patrick.kong@microfocus.com"
password = "Automation.123"
skip_cert_verification = "true"
}
  required_version = "~> 1.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
	region = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}

resource "aws_instance" "default" {
  ami = var.ami
  instance_type = var.instance_type
 
  
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
}





