resource "aws_instance" "import_instance" {
  ami ="ami-0eb9d6fc9fab44d24"
  instance_type = "t3.micro"
}