resource "aws_spot_instance_request" "cheap_worker" {
  ami           = data.aws_ami.ami.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "CheapWorker"
  }
}
