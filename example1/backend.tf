terraform {
  backend "s3" {
    bucket = "terraform-63"
    key    = "example1/terraform.tfstate"
    region = "us-east-1"
  }
}