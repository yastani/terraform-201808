#--------------------------------------------------------------
# DB Subnet Group
#--------------------------------------------------------------
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name = "${lookup(var.prefix, "default.prefix")}mysql57-subnet-group"

  subnet_ids = [
    "${split(",",lookup(var.subnet, "priv_subnet_ids"))}",
  ]
}
