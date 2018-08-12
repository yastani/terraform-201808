#--------------------------------------------------------------
# Route Table of Public
#--------------------------------------------------------------
resource "aws_route_table" "pub_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "${lookup(var.prefix, "default.prefix")}${lookup(var.route_table, "default.pub_subnet_route_table_name")}"
  }
}

#--------------------------------------------------------------
# Route Table of Private
#--------------------------------------------------------------
resource "aws_route_table" "priv_rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${lookup(var.prefix, "default.prefix")}${lookup(var.route_table, "default.priv_subnet_route_table_name")}"
  }
}
