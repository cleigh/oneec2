

resource "aws_instance" "app" {

lifecycle {
  ignore_changes = [ami, ebs_block_device, user_data,volume_tags]

}

  ami           = "ami-00e87074e52e6c9f9"
  instance_type = "t2.small"

  # the VPC subnet
  // VPC not needed here
  //vpc_id = "var.vpc_id"
  //subnet_id = "var.subnet_id"
  subnet_id = "subnet-423a350a"
  

  # the security group
  //vpc_security_group_ids = ["aws_security_group.allow-ssh.id"]

  # the public SSH key
  key_name = "ec2-key-pair"

    root_block_device {
      volume_size = var.OSDiskSize
      volume_type = "gp2"
      delete_on_termination = true
    }

    # user data
   // user_data = templatefile("${path.module}/userdata.tmpl", {hostname = "${var.environment_tag}}")
    
    tags = {
      Name = "appdocker"
      Environment = "PR"
      Application = "TEST"
    }
  }