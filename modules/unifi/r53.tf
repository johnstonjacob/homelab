resource "aws_route53_record" "dns" {
    zone_id = "Z2RBZ1BKHRSSR9"
    name = "unifi.johnstonjacob.com"
    type = "A"
    ttl = "300"
    records = ["${aws_eip.unifi_controller_eip.public_ip}"]
}
