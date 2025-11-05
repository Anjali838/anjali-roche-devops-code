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