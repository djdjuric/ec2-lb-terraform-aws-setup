variable "vpc_id" {
    type = string
    default = ""
    description = "VPC id"
    nullable = false
    sensitive = true
}

variable "pub_key_djdjuric" {
    type = string
    default = ""
    description = "my public idrsa key"
    nullable = false
    sensitive = true
}

variable "aws_provider" {
    type = map
    default = {
        "region" = "us-east-1"
        "profile" = "devops_dev"
        "creds_location" = "/home/djdjuric/.aws/credentials"
    }
  
}

variable "ec2_ami" {
    type = string
    default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"
    description = "AMI for "
}


