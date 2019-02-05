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
    ami = "ami-0f65671a86f061fcd" #Ubuntu 18.04
    instance_type = "t2.micro"
    subnet_id = "${var.aws_subnet_id}"
    vpc_security_group_ids = ["${aws_security_group.unifi_sg.id}"]
    key_name = "${var.aws_key_name}" 
    associate_public_ip_address = true

    root_block_device = {
        volume_size = "30"
    }

    provisioner "remote-exec" {
        script = "./files/install-unifi.sh"

        connection {
            type = "ssh"
            user = "ubuntu"
            private_key = "${file("${var.ssh_key_location}")}"
        }
    }

    tags = { 
        Name = "homelab-unifi-controller"
    }
}

resource "aws_eip" "unifi_controller_eip" {
  instance = "${aws_instance.unifi_controller.id}"
  vpc      = true
}
