resource "aws_vpc" "name_vpc" {
  cidr_block           = "subnet_ip"
  enable_dns_hostnames = "true"
  tags = {
    Name    = "name_vpc"
  }
  }
