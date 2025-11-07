terraform {

  backend "s3" {
    bucket = "anjali-roche-terraform-bucket"
    key = "dev/anjali/terraform.tfstate"
    dynamodb_table = "anjali-roche-table1" # Optional, for state locking
    region = "ap-southeast-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # Region location info
  region = "ap-southeast-2"
}

# calling module 

module "my-anjali-module-ec2" {
  source = "./modules/ec2"
  anjali-ami-id = "ami-0a25a306450a2cba3"
  vm-name = "anjali-vmby-module-dayfinal"
  vm-size = "t2.nano"
  ec2-key-name = "anjali-keyby-modedayfinal"
  private-key-algo = "RSA"
  key-size = 4096
  my-vpc-id = "vpc-02d56e9aa1ce2f114"
  my-sec-group-name = "anjali-bymode-sec"
  novm = 2
}