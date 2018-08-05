#--------------------------------------------------------------
# Route 53
#--------------------------------------------------------------
resource "aws_route53_zone" "private" {
  name       = "${lookup(var.prefix, "${terraform.workspace}.prefix")}priv.local"
  vpc_id     = "${lookup(var.vpc, "vpc_id")}"
  vpc_region = "${data.aws_region.region.name}"
}
