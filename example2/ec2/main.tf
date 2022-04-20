resource "aws_instance" "sample" {
  ami = "ami-0bb6af715826253bf"
  instance_type = "t3.micro"
  security_groups = [aws_security_group.allow_tls.id]
}