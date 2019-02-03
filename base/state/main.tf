provider "aws" {
    region = "us-east-1"
    profile = "self"
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "${var.s3_bucket}"

  tags {
    Name        = "${var.s3_bucket}"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "tf_state" {
  name           = "${var.s3_bucket}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
