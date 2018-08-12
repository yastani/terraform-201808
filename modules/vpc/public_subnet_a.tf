#--------------------------------------------------------------
# Public Subnet of Public
#--------------------------------------------------------------
resource "aws_subnet" "pub_subnet_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${lookup(var.subnet, "default.pub_subnet_a_cidr")}"
  availability_zone       = "${data.aws_availability_zones.azs.names[0]}"
  map_public_ip_on_launch = false

  tags {
    Name = "${lookup(var.prefix, "default.prefix")}${lookup(var.subnet, "default.pub_subnet_a_name")}"
  }
}

resource "aws_route_table_association" "pub_rta_a" {
  subnet_id      = "${aws_subnet.pub_subnet_a.id}"
  route_table_id = "${aws_route_table.pub_rt.id}"
}
