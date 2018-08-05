#--------------------------------------------------------------
# Route53 for web server in Private DNS
#--------------------------------------------------------------
resource "aws_route53_record" "private_web" {
  count   = "${lookup(var.ec2, "${terraform.workspace}.web_server_count")}"
  zone_id = "${lookup(var.route53, "private_zone_id")}"
  name    = "${format("web-%03d", count.index + 1)}.${lookup(var.prefix, "${terraform.workspace}.prefix")}priv.local"
  type    = "A"
  ttl     = 60

  records = [
    "${element(aws_instance.web.*.private_ip, count.index)}",
  ]

  depends_on = [
    "aws_instance.web",
  ]
}
