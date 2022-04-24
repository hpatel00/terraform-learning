variable "example" {
  default = "Hello World"
}

output "example" {
  value = var.example
}

## Data Types

# String Data Type
variable "Sample1" {
  default = "Hello World"
}

# Number Data Type
variable "Sample2" {
  default = 100
}

variable "Sample3" {
  default = true
}

## Variable Types

# List
variable "SampleList" {
  type = list(string) ## optional
  default = [
  "Hello",
  1000,
  true,
  "World"
  ]
}

# Map
variable "SampleMap" {
  type = map ## optional
  default = {
    sring = "Hello",
    number = 1000,
    boolean= true
  }
}

output "samplelist-1" {
  value = var.SampleList[0]
}

output "samplemap-1" {
  value = var.SampleMap["number"] ##considers it a string
}

output "sample2" {
  value = var.Sample2 ##considers it a number
}

#when passing variables to this file, use -var_file=<file>.tfvars in the commandline
variable "URL" {}
output "URL" {
  value = var.URL
}

#supply environment variable in the command line using -var <var_Name>=input
variable "URL_CLI" {}
output "URL_CLI" {
  value = var.URL_CLI
}

# use export TF_VAR_<var_Name>=input to pass this variable through shell
variable "URL_SHELL" {}
output "URL_SHELL" {
  value = var.URL_SHELL
}

#variable supplied in sample.auto.tfvars file
variable "URL1" {}
output "URL1" {
  value = var.URL1
}