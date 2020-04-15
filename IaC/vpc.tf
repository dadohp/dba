# VPC
resource "aws_vpc" "nama_vpc" {
  cidr_block           = "subnet_ip"
  enable_dns_hostnames = "true"
  tags = {
    Name    = "nama_vpc"
  }
  }

 # SUBNET PUBLIC
 resource "aws_subnet" "nama_subnet" {
  vpc_id                  = "${aws_vpc.nama_vpc.id}"
  cidr_block              = "subnet_ip"
  map_public_ip_on_launch = "true"
  tags = {
   Name    = "nama_subnet_a"
  }}

  resource "aws_subnet" "nama_subnet" {
  vpc_id                  = "${aws_vpc.nama_vpc.id}"
  cidr_block              = "subnet_ip"
  map_public_ip_on_launch = "true"
  tags = {
   Name    = "nama_subnet_b"
  }}

# INTERNET GATEWAY
resource "aws_internet_gateway" "nama_gateway" {
  vpc_id = "${aws_vpc.nama_vpc.id}"
  tags = {
    Name    = "nama_gateway"
}
}

# ROUTE TABLE
resource "aws_route_table" "nama_route" {
  vpc_id = "${aws_vpc.nama_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.nama_gateway.id}"
  }
  tags = {
    Name    = "nama_route"
  }
}

# ROUTE ASSOC SUBNET 
resource "aws_route_table_association" "nama_assoc" {
    subnet_id = "${aws_subnet.nama_subnet.id}"
    route_table_id = "${aws_route_table.nama_route.id}"
}