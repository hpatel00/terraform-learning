terraform {
  backend "s3" {
    bucket = "terraform-63"
    key    = "example2/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}