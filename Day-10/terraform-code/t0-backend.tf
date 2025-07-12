terraform {
  backend "s3" {
    bucket         = "bala-training-backend-bucket"
    key            = "dev/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-table"
    region         = "us-east-1"
    profile        = "terraform-training"
  }
}
