data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
module "vpc" {
  source  = "../terraform-aws-vpc"

# vpc basic details
  name = "vpc-${var.environment}"
  cidr = var.cidr_block
  azs = slice(data.aws_availability_zones.example.names, 0 , 2)

  public_subnets = var.public_subnet_cidr
  private_subnets = var.private_subnet_cidr
  database_subnets = var.db_subnet_cidr

  public_subnet_names = ["public-subnet-1", "public-subnet-2"]
  private_subnet_names = ["private-subnet-1", "private-subnet-2"]
  database_subnet_names = ["db-subnet-1", "db-subnet-2"]

  create_database_subnet_route_table = true

  enable_nat_gateway = true
  single_nat_gateway = true

  create_igw = true

#   tags = local.Name

  vpc_tags = {
    Name: "vpc-${var.environment}"
  }
}