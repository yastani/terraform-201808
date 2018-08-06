#--------------------------------------------------------------
# Security Group for web server
#--------------------------------------------------------------
resource "aws_security_group" "web-sg" {
  name                   = "${lookup(var.prefix, "${terraform.workspace}.prefix")}web-sg"
  vpc_id                 = "${lookup(var.vpc, "vpc_id")}"
  revoke_rules_on_delete = false

  tags {
    Name = "${lookup(var.prefix, "${terraform.workspace}.prefix")}web-sg"
  }
}

resource "aws_security_group_rule" "web-sg_in_http_from_web-alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.web-sg.id}"
  source_security_group_id = "${aws_security_group.web-alb-sg.id}"
}

resource "aws_security_group_rule" "web-sg_in_http_from_web" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.web-sg.id}"
  source_security_group_id = "${aws_security_group.web-sg.id}"
}

resource "aws_security_group_rule" "web-sg_in_ssh_from_own" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.web-sg.id}"

  cidr_blocks = [
    "${lookup(var.security_group_ips, "own_ip")}",
  ]
}

resource "aws_security_group_rule" "web-sg_out_to_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.web-sg.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

#--------------------------------------------------------------
# Security Group for web alb
#--------------------------------------------------------------
resource "aws_security_group" "web-alb-sg" {
  name                   = "${lookup(var.prefix, "${terraform.workspace}.prefix")}web-alb-sg"
  vpc_id                 = "${lookup(var.vpc, "vpc_id")}"
  revoke_rules_on_delete = false

  tags {
    Name = "${lookup(var.prefix, "${terraform.workspace}.prefix")}web-alb-sg"
  }
}

resource "aws_security_group_rule" "web-alb-sg_in_http_from_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.web-alb-sg.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "web-alb-sg_out_to_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.web-alb-sg.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
