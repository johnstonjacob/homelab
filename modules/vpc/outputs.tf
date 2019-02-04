output "homelab_vpc_id" {
    value = "${aws_vpc.homelab_vpc.id}"
}

output "homelab_subnet_id" {
    value = "${aws_subnet.homelab_subnet.id}"
}
