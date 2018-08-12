#--------------------------------------------------------------
# Security Group of mysql
#--------------------------------------------------------------
resource "aws_security_group" "mysql_sg" {
  name   = "${lookup(var.prefix, "default.prefix")}mysql-sg"
  vpc_id = "${lookup(var.vpc, "vpc_id")}"

  tags {
    Name = "${lookup(var.prefix, "default.prefix")}mysql-sg"
  }
}

resource "aws_security_group_rule" "mysql_sg_in_mysql_from_web" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.mysql_sg.id}"
  source_security_group_id = "${lookup(var.security_group, "web_sg_id")}"
}

resource "aws_security_group_rule" "mysql_sg_out_to_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.mysql_sg.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
