resource "aws_s3_bucket_acl" "vishal-s3" {
  bucket = "my"
  acl    = "private"

  tag = {
    Name        = "My bucket"
    Environment = "test"
  }
}