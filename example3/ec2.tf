resource "aws_spot_instance_request" "cheap_worker" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  wait_for_fulfillment   = true
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "test"
  }
#  provisioner "remote-exec" {
#    connection {
#      host = self.public_ip
#      type     = "ssh"
#      user     = "centos"
#      password = "DevOps321"
#    }
#    #intentionally giving exit 1
#    inline = [
#      "exit 1"
#    ]
#  }
}

resource "null_resource" "provisioner" {
  provisioner "remote-exec" {
    connection {
      host     = aws_spot_instance_request.cheap_worker.public_ip
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
    }
    #intentionally giving exit 1
    inline = [
      "exit 1"
    ]
  }
}

data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "base-with-ansible"
  owners           = ["self"]
}

resource "aws_security_group" "allow_all" {
  name        = "allow_test"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_test"
  }
}
