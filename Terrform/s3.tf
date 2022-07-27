resource "aws_s3_bucket_acl" "vishal-s3" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"

  tag = {
    Name        = "My bucket"
    Environment = "test"
  }
}