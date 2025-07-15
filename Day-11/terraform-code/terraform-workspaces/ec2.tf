resource "aws_instance" "web" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}