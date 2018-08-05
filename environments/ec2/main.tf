module "ec2" {
  source  = "../../modules/ec2"
  vpc     = "${data.terraform_remote_state.vpc.vpc}"
  subnet  = "${data.terraform_remote_state.vpc.subnet}"
  route53 = "${data.terraform_remote_state.route53.route53}"

  prefix             = "${var.prefix}"
  ec2                = "${var.ec2}"
  security_group_ips = "${var.security_group_ips}"

  providers = {
    aws = "aws.tokyo"
  }
}
