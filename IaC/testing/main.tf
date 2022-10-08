provider "aws" {
  region = var.aws_region
  skip_region_validation = true
}

# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags= {
    Name = var.tag_name
  }
}

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-southeast-3"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-instance"
}

variable "ami_id" {
  description = "AMI for linux Ec2 instance"
  default     = "ami-056ff31d39c7cc528"
}