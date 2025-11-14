terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #   key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = file(var.user_data_file)

  tags = {
    Name = var.instance_name
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
