provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key_pair" {
  key_name   = "my-key-pair"
  public_key = var.public_key
}

terraform {
  backend "s3" {
    bucket         = "state-bucket2"
    key            = "terraform/ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking-table"
    encrypt        = true
  }
}

resource "aws_security_group" "my_sg" {
  name        = "sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // not safe if not changed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "meu_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "EC2Instance"
  }
}