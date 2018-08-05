#--------------------------------------------------------------
# Private Subnet of Private
#--------------------------------------------------------------
resource "aws_subnet" "priv_subnet_a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.subnet, "default.priv_subnet_a_cidr")}"
  availability_zone = "${lookup(var.region, "default.region")}a"

  tags {
    Name = "${lookup(var.prefix, "${terraform.workspace}.prefix")}${lookup(var.subnet, "default.priv_subnet_a_name")}"
  }
}

resource "aws_route_table_association" "priv_rta_a" {
  subnet_id      = "${aws_subnet.priv_subnet_a.id}"
  route_table_id = "${aws_route_table.priv_rt.id}"
}
