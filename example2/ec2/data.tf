data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "base-with-ansible"
  owners           = ["self"]
}