resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "hesam-bucket-tf"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}