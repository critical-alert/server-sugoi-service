variable "aws_access_key" {}
variable "aws_secret_key" {}
#variable "key_path" {}
variable "key_name" {}
variable "aws_region" {
    default = "ap-northeast-1"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_instance" "app" {
    ami = "ami-2f1bf82f"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
    security_groups = ["ssh_enable"]
}

resource "aws_security_group" "ssh_enable" {
  name = "ssh_enable"
    description = "Used in the terraform"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags {
        Name = "create terraform vpc"
    }
}

resource "aws_subnet" "1a" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"
    tags {
        Name = "create terraform subnet"
    }
}

resource "aws_subnet" "1c" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-1c"
    tags {
        Name = "create terraform subnet"
    }
}
