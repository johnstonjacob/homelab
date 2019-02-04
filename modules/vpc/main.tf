provider "aws" {
    region = "us-east-2"
    profile = "self"
}

terraform {
  backend "s3" {
    bucket = "terraform.johnstonjacob.com"
    key    = "homelab/vpc"
    region = "us-east-2"
    profile = "self"
  }
}

resource "aws_vpc" "homelab_vpc"{
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "homelab"    
    }
}

resource "aws_subnet" "homelab_subnet" {
    vpc_id = "${aws_vpc.homelab_vpc.id}"

    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "homelab"    
    }
}

resource "aws_internet_gateway" "homelab_gw" {
  vpc_id = "${aws_vpc.homelab_vpc.id}"

  tags = {
    Name = "homelab"
  }
}
