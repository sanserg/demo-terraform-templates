terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  version = "~> 2.0"
  region  = "${var.aws_region}"
}


resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${var.aws_key_pair_name}"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}


resource "aws_instance" "my_aws_instance" {
  instance_type = "${var.aws_image_size}"
  ami           = "${data.aws_ami.aws_ami.id}"
  key_name      = "${aws_key_pair.auth.id}"
  tags = "${merge(module.camtags.tagsmap, tomap({"Name"="${var.aws_instance_name}"}))}"
}

module "camtags" {
  source  = "../Modules/camtags"
}
