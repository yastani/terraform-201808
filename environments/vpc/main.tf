module "vpc" {
  source      = "../../modules/vpc"
  prefix      = "${var.prefix}"
  vpc         = "${var.vpc}"
  subnet      = "${var.subnet}"
  route_table = "${var.route_table}"

  providers = {
    aws = "aws.tokyo"
  }
}
