module "rds" {
  source         = "../../modules/rds"
  vpc            = "${data.terraform_remote_state.vpc.vpc}"
  subnet         = "${data.terraform_remote_state.vpc.subnet}"
  route53        = "${data.terraform_remote_state.route53.route53}"
  security_group = "${data.terraform_remote_state.ec2.security_group}"

  prefix          = "${var.prefix}"
  rds             = "${var.rds}"
  parameter_group = "${var.parameter_group}"

  providers = {
    aws = "aws.tokyo"
  }
}
