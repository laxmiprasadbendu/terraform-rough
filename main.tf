provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAYH5NRM4UZBY6FZOD"
  secret_key = "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"
}
resource "aws_s3_bucket" "b" {
  bucket = "laxmi-29-12-21"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
