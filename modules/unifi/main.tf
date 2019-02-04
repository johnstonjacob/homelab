provider "aws" {
    region = "us-east-2"
    profile = "self"
}

terraform {
  backend "s3" {
    bucket = "terraform.johnstonjacob.com"
    key    = "homelab/unifi-controller"
    region = "us-east-2"
    profile = "self"
  }
}

resource "aws_instance" "unifi_controller"{
    ami = "ami-0cce9adf562106b82" #Ubuntu 18.04
    instance_type = "t2.micro"
    subnet_id = "${var.aws_subnet_id}"
    vpc_security_group_ids = ["${aws_security_group.unifi_sg.id}"]

    provisioner "remote-exec" {
        script = ""
    }

    tags = { 
        Name = "homelab-unifi-controller"
    }
}

resource "aws_eip" "unifi_controller_eip" {
  instance = "${aws_instance.unifi_controller.id}"
  vpc      = true
}
