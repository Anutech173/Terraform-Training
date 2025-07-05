# Terraform Settings Block

terraform {
  required_providers {
    aws = {

      source  = "hashicorp/aws"
    }
  }
}

# Provider Block

provider "aws" {
  profile = "terraform-training" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block

resource "aws_instance" "ec2demo" {
  ami           = "ami-05ffe3c48a9991133" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  tags = {
    Name= "ec2-from-terraform"
  }

}

#output Blocks
output "instance_arn" {
  value = aws_instance.ec2demo.arn
}