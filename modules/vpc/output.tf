output "vpc" {
  value = "${
    map(
      "vpc_id",   "${aws_vpc.vpc.id}",
      "vpc_cidr", "${aws_vpc.vpc.cidr_block}"
    )
  }"
}

output "subnet" {
  value = "${
    map(
      "pub_subnet_ids",    "${aws_subnet.pub_subnet_a.id},${aws_subnet.pub_subnet_c.id}",
      "priv_subnet_ids",   "${aws_subnet.priv_subnet_a.id},${aws_subnet.priv_subnet_c.id}",

      "pub_subnet_a_cidr_block", "${aws_subnet.pub_subnet_a.cidr_block}",
      "pub_subnet_c_cidr_block", "${aws_subnet.pub_subnet_c.cidr_block}",

      "priv_subnet_a_cidr_block", "${aws_subnet.priv_subnet_a.cidr_block}",
      "priv_subnet_c_cidr_block", "${aws_subnet.priv_subnet_c.cidr_block}"
    )
  }"
}
