variable "aws_subnet_id" {
    description = "Subnet ID for instance to be started in"
}

variable "aws_vpc_id" {
    description = "VPC ID for SG to be created in"
}

variable "aws_key_name" {
    description = "AWS key pair name"
}

variable "ssh_key_location" {
    description = "AWS priv key location"
}
