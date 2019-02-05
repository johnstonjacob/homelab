provider "aws" {
    profile = "self"
    region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform.johnstonjacob.com"
    key    = "homelab/unifi-controller"
    region = "us-east-2"
    profile = "self"
  }
}

module "vpc" {
    source = "./modules/vpc"
}
/*
module "unifi" {
    source = "./modules/unifi"
    aws_subnet_id = "${module.vpc.homelab_subnet_id}" 
    aws_vpc_id = "${module.vpc.homelab_vpc_id}" 
    aws_key_name = "${var.aws_key_name}"
    ssh_key_location = "${var.ssh_key_location}"
}

output "instance_ip" {
    value = "${module.unifi.instance_ip}"
}
*/
