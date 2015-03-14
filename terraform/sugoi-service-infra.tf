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
}
