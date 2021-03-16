resource "aws_instance" "app" {
  ami           = "lookup(var.AMIS, var.AWS_REGION)"
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = "aws_subnet.main-public-1.id"

  # the security group
  vpc_security_group_ids = ["aws_security_group.allow-ssh.id"]

  # the public SSH key
  key_name = "aws_key_pair.mykeypair.key_name"

# user data
user_data = "data.template_file.init.rendered"

  tags {
    Name = "appdocker"
    Environment = "PR"
    Application = "TEST"
  }

  root_block_device {
    volume_size = "${var.OSDiskSize}"
    volume_type = "gp2"
    delete_on_termination = true
  }

}

data "template_file" "init"{
  template = <<-EOF
            #!/bin/bash
            hostnamectl set-hostname "$${hostname}"
            EOF

  vars {
    hostname = "appdocker"
  }

}

resource "aws_key_pair" "mykeypair" {
  key_name = "leighkey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
