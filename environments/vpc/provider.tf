#####################################
# Provider Settings
#####################################
provider "aws" {
  alias  = "tokyo"
  region = "${lookup(var.region, "${terraform.workspace}.region")}"
}
