resource "aws_s3_bucket_acl" "vishal_s3" {
  bucket = "my"
  acl    = "private"
}