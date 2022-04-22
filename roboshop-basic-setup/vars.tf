variable "COMPONENTS" {
  default = [
    "mongodb",
    "catalogue"
  ]
}
variable "APP_VERSION" {
  default = [
    "null",
    "1.0.1"
  ]
}

variable "ALL_COMPONENTS" {
  default = {
    mongodb = {
      app_version = "null"
    }
    catalogue = {
      app_version = "1.0.1"
    }
    redis = {
      app_version = "null"
    }
     user = {
      app_version = "1.0.0"
    }
    cart = {
      app_version = "1.0.2"
    }
    mysql = {
      app_version = "null"
    }
    shipping = {
      app_version = "1.0.0"
    }
    rabbitmq = {
      app_version = "null"
    }
    payment = {
      app_version = "1.0.0"
    }
    frontend = {
      app_version = "1.0.0"
    }
  }
}