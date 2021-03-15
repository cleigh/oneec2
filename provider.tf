provider "aws" { 
    region = "${var.AWS_REGION}"
}

terraform {
    backend = "s3"
    bucket = "alaskantiger"
    key = ec2/demo1
    
}