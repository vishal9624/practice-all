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
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}
resource "aws_eip" "elasticip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elasticip.id
  subnet_id     = aws_subnet.public.id
}

resource "aws_route_table" "IGW_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
  
resource "aws_route_table" "NAT_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nat.id
  }
}

resource "aws_route_table_association" "public_subnet1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.IGW_route_table.id
}
resource "aws_route_table_association" "public_subnet2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.IGW_route_table.id
}
resource "aws_route_table_association" "private_subnet1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.NAT_route_table.id
}
resource "aws_route_table_association" "private_subnet2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.NAT_route_table.id
}