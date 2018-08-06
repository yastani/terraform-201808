#--------------------------------------------------------------
# Route53 for rds Internal DNS
#--------------------------------------------------------------
resource "aws_route53_record" "mysql" {
  zone_id = "${lookup(var.route53, "private_zone_id")}"
  name    = "${format("mysql57-%03d", count.index + 1)}.${lookup(var.prefix, "${terraform.workspace}.prefix")}priv.local"
  type    = "CNAME"
  ttl     = 60

  records = [
    "${aws_db_instance.mysql57.address}",
  ]

  depends_on = [
    "aws_db_instance.mysql57",
  ]
}
