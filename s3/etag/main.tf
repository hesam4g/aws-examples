terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


resource "aws_s3_bucket" "default" {

}


resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "my-file-etag.txt"
  source = "my-file-etag.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("my-file-etag.txt")
}