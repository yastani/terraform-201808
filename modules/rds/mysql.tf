#--------------------------------------------------------------
# RDS for MySQL
#--------------------------------------------------------------
resource "aws_db_instance" "mysql57" {
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = false
  copy_tags_to_snapshot       = false
  multi_az                    = true
  publicly_accessible         = false
  skip_final_snapshot         = true
  apply_immediately           = true
  final_snapshot_identifier   = "${lookup(var.prefix, "default.prefix")}mysql57"
  identifier                  = "${lookup(var.prefix, "default.prefix")}mysql57"
  engine                      = "mysql"
  engine_version              = "5.7.22"
  instance_class              = "${lookup(var.rds, "default.instance_class")}"
  allocated_storage           = 10
  storage_type                = "gp2"
  username                    = "${lookup(var.rds, "default.username")}"
  password                    = "${data.aws_kms_secret.rds.mysql_master_password}"
  parameter_group_name        = "${aws_db_parameter_group.mysql57_param_group.name}"
  backup_retention_period     = "${lookup(var.rds, "default.backup_retention_period")}"
  backup_window               = "${lookup(var.rds, "default.preferred_backup_window")}"
  maintenance_window          = "${lookup(var.rds, "default.preferred_maintenance_window")}"
  monitoring_interval         = 60
  monitoring_role_arn         = "${data.aws_iam_role.rds_monitoring_role.arn}"
  db_subnet_group_name        = "${aws_db_subnet_group.mysql_subnet_group.name}"

  vpc_security_group_ids = [
    "${aws_security_group.mysql_sg.id}",
  ]
}
