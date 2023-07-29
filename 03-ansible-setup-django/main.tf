terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03f65b8614a860c29" # ubuntu
  instance_type = "t2.micro"
  key_name      = "iac-studies"

  tags = {
    Name = "Terraform With Ansible and Python"
  }
}
