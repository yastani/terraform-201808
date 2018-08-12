#--------------------------------------------------------------
# RDS MySQL Parameter Group
#--------------------------------------------------------------
resource "aws_db_parameter_group" "mysql57_param_group" {
  name   = "${lookup(var.prefix, "default.prefix")}mysql57-param-group"
  family = "${lookup(var.parameter_group, "default.db_family")}"

  parameter {
    name  = "time_zone"
    value = "${lookup(var.parameter_group, "default.timezone")}"
  }

  parameter {
    name  = "slow_query_log"
    value = "${lookup(var.parameter_group, "default.slow_query_log")}"
  }

  parameter {
    name  = "long_query_time"
    value = "${lookup(var.parameter_group, "default.long_query_time")}"
  }

  parameter {
    name  = "log_output"
    value = "${lookup(var.parameter_group, "default.log_output")}"
  }

  parameter {
    name  = "character_set_server"
    value = "${lookup(var.parameter_group, "default.character_set_server")}"
  }
}
