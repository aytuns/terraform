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
    region = "us-east-1"
    # access_key = "AKIA2UC3AXWMKB6OBXFZ"
    # secret_key = "m74ZEVxbyMk2Ae61qQ+uYhWF6nfnKHQKCyZI7Ziw"
}

resource "aws_instance" "example_server" {
    ami = "ami-06f4fa348c295a6f6"
    instance_type = "t2.micro"
    tags = {
        Name = "mini_server-1"
    }
}

resource "aws_ecr_repository" "ecr_1" {
  name = "ecr-1"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}