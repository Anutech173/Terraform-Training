# us-east-1 region

resource "aws_instance" "web" {
  provider = aws.virginia-region
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

# us-east-2 region
resource "aws_instance" "web2" {
  provider = aws.ohio-region
  ami           = "ami-0eb9d6fc9fab44d24"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}


