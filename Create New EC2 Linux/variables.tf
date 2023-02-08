variable "access_key" {
    description = "AWS Access key"
    default = ""
}

variable "secret_key" {
    description = "AWS Secret Key"
    default = ""
}


variable "region" {
    description = "AWS region for hosting our your network"
    default = ""
}


variable "aws_ami" {
    description = "AWS region for hosting our your network"
    default = "ami-0aa7d40eeae50c9a9"
}


variable "key_name" {
    description = "Key name for SSH into EC2"
    default = "awskey1"
}

variable "subnet_id" {
  description = "Subnet"
  default = ""
}