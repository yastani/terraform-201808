output "security_group" {
  value = "${
    map(
      "web_sg_id", "${aws_security_group.web-sg.id}"
    )
  }"
}
