resource "aws_spot_instance_request" "cheap_worker" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  wait_for_fulfillment   = true
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = var.COMPONENT
  }
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
    }
    inline = [
      "ansible-pull -U https://github.com/hpatel00/ansible roboshop.yml -e HOST=localhost -e role_name=${var.COMPONENT} -e ENV=dev -e APP_VERSION=${var.APP_VERSION}"
    ]
  }
}

#decoupling ec2 creation and provisioner
#resource "null_resource" "ansible-apply" {
#  provisioner "remote-exec" {
#    connection {
#      host = aws_spot_instance_request.cheap_worker.public_ip
#      type     = "ssh"
#      user     = "centos"
#      password = "DevOps321"
#    }
#    inline = [
#      "ansible-pull -U https://github.com/hpatel00/ansible roboshop.yml -e HOST=localhost -e role_name=${var.COMPONENT} -e ENV=dev -e APP_VERSION=${var.APP_VERSION}"
#    ]
#  }
#}