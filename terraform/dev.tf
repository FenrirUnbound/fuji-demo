provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_security_group" "testingterra" {
  name = "terrasecuritygroup"
  description = "Used in the test terraform"

  # SSH access from anywhere
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
    ami = "${var.ami_id}"
    instance_type = "t1.micro"
    security_groups = ["${aws_security_group.testingterra.name}"]
}

output "public_dns" {
    value = "${aws_instance.example.public_dns}"
}
