provider "aws" {
    region = "eu-west-2"
  }

  # The networking for VPC
resource "aws_vpc" "Jenkins-vpc" {
  cidr_block         = "10.0.0.0/16"
  instance_tenancy   = "default"
  enable_dns_support = "true"

  tags = {
    name = "jenkins-vpc"
  }
}

# SUBNETS

resource "aws_subnet" "Pub-sub"{
   vpc_id =  aws_vpc.Jenkins-vpc.id
   cidr_block = "10.0.10.0/24"
   availability_zone = "eu-west-2a"
  }

  resource "aws_subnet" "Priv-sub"{
   vpc_id =  aws_vpc.Jenkins-vpc.id
   cidr_block = "10.0.20.0/24"
   availability_zone = "eu-west-2b"
  }
