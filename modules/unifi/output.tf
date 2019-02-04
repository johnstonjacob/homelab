output "instance_ip" {
    value = "${aws_eip.unifi_controller_eip.public_ip}"
}
