resource "aws_vpc" "main" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.100.1.0/24"
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.100.2.0/24"
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.100.11.0/24"
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.100.12.0/24"
}