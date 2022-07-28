resource "aws_instance" "vishal" {
  ami           = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"

  tags = {
    Name = "for_you"
  }
}