#-----test/main.tf

provider "aws" {
  region = "${var.aws_region}"
}

data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

data "template_file" "user-init" {
  count    = 2
  template = "${file("userdata.tpl")}"

}

resource "aws_instance" "test_server" {
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"

  tags {
    Name = "dkupp_server-${count.index+1}"
  }

  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${var.subnets}"
  user_data              = "${data.template_file.user-init.*.rendered[count.index]}"
}
