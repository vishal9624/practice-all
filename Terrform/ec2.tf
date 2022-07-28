resource "aws_subnet" "vishal_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "0.0.0.0/24"
  availability_zone = "us-east-1"

  tags = {
    Name = "for_practice"
  }
}