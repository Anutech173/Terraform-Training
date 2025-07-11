# Terraform Settings Block
terraform {
  required_version = "~>1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}
#Terraform Provider Block

provider "aws" {
  profile = "terraform-training"
  region  = "us-east-1"

}