terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
  provider "aws" {
  region     = "us-east-2"
}
resource "aws_instance" "example" {
  ami           = "ami-09040d770ffe2224f"
  instance_type = var.aws_machine_type
  key_name      = var.aws_key_name
  tags = {
    Name = var.instance_name
  }

  security_groups = [aws_security_group.ssh_access.name]

  user_data = <<-EOF
              #!/bin/bash
              useradd -m -s /bin/bash ubuntu
              EOF
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Allow SSH, HTTP, and HTTPS access"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"   # Represents all protocols
    cidr_blocks     = ["0.0.0.0/0"]
  }
}