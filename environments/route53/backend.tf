terraform {
  required_version = ">= 0.11.0"

  backend "s3" {
    bucket = "terraform-201808-states"
    key    = "route53/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "terraform-201808-states"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
