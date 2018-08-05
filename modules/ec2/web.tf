#--------------------------------------------------------------
# EIP for web server
#--------------------------------------------------------------
resource "aws_eip" "web" {
  count = "${lookup(var.ec2, "${terraform.workspace}.web_server_count")}"
  vpc   = true
}

resource "aws_eip_association" "web" {
  count         = "${lookup(var.ec2, "${terraform.workspace}.web_server_count")}"
  instance_id   = "${element(aws_instance.web.*.id, count.index)}"
  allocation_id = "${element(aws_eip.web.*.id, count.index)}"
}

#--------------------------------------------------------------
# AMI for web server
#--------------------------------------------------------------
data "aws_ami" "amazon_linux_1_latest" {
  most_recent = true

  owners = [
    "amazon",
  ]

  filter {
    name = "architecture"

    values = [
      "x86_64",
    ]
  }

  filter {
    name = "root-device-type"

    values = [
      "ebs",
    ]
  }

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*",
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm",
    ]
  }

  filter {
    name = "block-device-mapping.volume-type"

    values = [
      "gp2",
    ]
  }
}

#--------------------------------------------------------------
# Instance for web server
#--------------------------------------------------------------
resource "aws_instance" "web" {
  count         = "${lookup(var.ec2, "${terraform.workspace}.web_server_count")}"
  ami           = "${data.aws_ami.amazon_linux_1_latest.id}"
  instance_type = "${lookup(var.ec2, "${terraform.workspace}.web_server_type")}"
  subnet_id     = "${element(split(",",lookup(var.subnet, "pub_subnet_ids")), count.index % 2)}"
  key_name      = "${lookup(var.ec2, "${terraform.workspace}.key_name")}"

  user_data_base64 = <<EOF
IyEvYmluL2Jhc2gKCnN1ZG8geXVtIC15IGluc3RhbGwgaHR0cGQKc3VkbyBjaGtj
b25maWcgaHR0cGQgb24Kc3VkbyBta2RpciAtcCAvdmFyL3d3dy9odG1sCnN1ZG8g
ZWNobyAke1JBTkRPTX0gPiAvdmFyL3d3dy9odG1sL2luZGV4Lmh0bWwKc3VkbyBz
ZXJ2aWNlIGh0dHBkIHN0YXJ0Cg==
EOF

  vpc_security_group_ids = [
    "${aws_security_group.web-sg.id}",
  ]

  tags {
    Name = "${lookup(var.prefix, "${terraform.workspace}.prefix")}${format("web-%03d", count.index + 1)}"
  }
}
