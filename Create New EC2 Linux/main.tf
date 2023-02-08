provider "aws" {
        access_key = "${var.access_key}"
        secret_key = "${var.secret_key}"
        region = "${var.region}"
}

resource "aws_instance" "InstanceLinux" {
        ami = "${var.aws_ami}"
        instance_type = "t2.micro"
        key_name = "${var.key_name}"
        user_data = "${file("install_agent_linux.sh")}"
        subnet_id = "${var.subnet_id}"
        vpc_security_group_ids = ["${aws_security_group.InstanceLinux.id}"]
  tags = {
    Name = "Install Agent XDR on Linux Instance"
  }
}

#Creating the Security Group  
resource "aws_security_group" "InstanceLinux" {
  name        = "InstanceLinux"
  description = "Allow rule inbound traffic"
  vpc_id      = "vpc-085f2ff26a69d7aa9"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]    
  }
}