variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/craigleigh/working/projects/ssh_keys/leighkey/leighkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/Users/craigleigh/working/projects/ssh_keys/leighkey/leighkey.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-02eac2c0129f6376b"
    us-east-2 = "ami-02eac2c0129f6376b"
  }
}

variable "OSDiskSize" {
  default = "100"
  
}
