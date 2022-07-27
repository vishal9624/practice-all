resource "aws_s3_bucket_acl" "vishal" {
  bucket = "my-bucket"
  acl    = "private"
}