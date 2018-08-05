module "route53" {
  source = "../../modules/route53"
  prefix = "${var.prefix}"
  vpc    = "${data.terraform_remote_state.vpc.vpc}"

  providers = {
    aws = "aws.tokyo"
  }
}
