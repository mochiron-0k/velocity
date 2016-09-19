#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-097d9235
#
# Your security group ID is:
#
#     sg-74a4d00e
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     velocity-1679091c5a880faf6fb5e6087eb1b2dc
#

resource "aws_instance" "web" {
  count = "1"
  ami = "ami-db24d8b6"
  instance_type = "t2.micro"
  subnet_id = "subnet-097d9235"
  vpc_security_group_ids = ["sg-74a4d00e"]

  tags {
    Identity = "..."
    Test = "test"
    Velocity = "NY"
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]

}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}
