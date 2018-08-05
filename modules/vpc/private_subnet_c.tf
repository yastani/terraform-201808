#--------------------------------------------------------------
# Private Subnet of Private
#--------------------------------------------------------------
resource "aws_subnet" "priv_subnet_c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${lookup(var.subnet, "default.priv_subnet_c_cidr")}"
  availability_zone = "${lookup(var.region, "default.region")}a"

  tags {
    Name = "${lookup(var.prefix, "${terraform.workspace}.prefix")}${lookup(var.subnet, "default.priv_subnet_c_name")}"
  }
}

resource "aws_route_table_association" "priv_rta_c" {
  subnet_id      = "${aws_subnet.priv_subnet_c.id}"
  route_table_id = "${aws_route_table.priv_rt.id}"
}
