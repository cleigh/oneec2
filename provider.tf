provider "aws" { 
    //region = "var.AWS_REGION"
    region = "us-east-1"
}

terraform {
    backend "s3" {
    bucket = "alaskantiger"
    key = "ec2/demo1"
    region = "us-east-1"
    }   
}