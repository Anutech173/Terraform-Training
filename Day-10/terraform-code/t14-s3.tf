resource "aws_s3_bucket" "example" {
  bucket = "some-bucket-xxxxxxxxx1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}