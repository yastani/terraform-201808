output "route53" {
  value = "${
    map(
      "private_zone_id",   "${aws_route53_zone.private.zone_id}"
    )
  }"
}
