# VPC
resource "aws_vpc" "name_vpc" {
  cidr_block           = "subnet_ip"
  enable_dns_hostnames = "true"
  tags = {
    Name    = "name_vpc"
  }
  }

 # SUBNET
 resource "aws_subnet" "nama_subnet" {
  vpc_id                  = "${aws_vpc.nama_vpc.id}"
  cidr_block              = "subnet_ip"
  map_public_ip_on_launch = "true"
  tags = {
   Name    = "nama_subnet"
  }}

# INTERNET GATEWAY
resource "aws_internet_gateway" "nama_gateway" {
  vpc_id = "${aws_vpc.nama_vpc.id}"
  tags = {
    Name    = "nama_gateway"
}
}