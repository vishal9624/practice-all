resource "aws_subnet" "vishal" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "0.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "for_practice"
  }
}

resource "aws_instance" "flipkart" {
  ami           = "ami-0888c389af05d881a" # us-west-2
  instance_type = "t2.micro"
}