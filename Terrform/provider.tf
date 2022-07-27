provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "${var.base["region"]}"
}

terraform {
  backend "s3" {
    bucket = "my_s3_bucket"
    key    = "backend/state"
    region = "us-east-1"
    encrypt = true
    shared_credentials_file = "~/.aws/credentials"
  }
}