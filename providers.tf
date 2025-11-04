terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # Region location info
  region = "ap-southeast-2"
}

# Creating ec2 vm
resource "aws_instance" "example" {
    ami = "ami-0a25a306450a2cba3"
    instance_type = "t2.nano"
    key_name = "roche-key"
    tags_all = {
      "Name" = "anjali-vm-1"
    }
}