data "aws_iam_role" "rds_monitoring_role" {
  name = "rds-monitoring-role"
}

data "aws_kms_secret" "rds" {
  "secret" {
    name    = "mysql_master_password"
    payload = "AQICAHgyxSHOTFH9EN6T9dav1qupup97BXCd/g8Lc2tkuU0xAwGBBTqWSLntQp2LWxAWYBflAAAAbTBrBgkqhkiG9w0BBwagXjBcAgEAMFcGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMMFjLGy/vbmCdVkmAAgEQgCq6VvwxzxzPSm+WihxTchMYOTkF4ML2tsU7yN2wtu6qDq+4wgMPqoqU6jk="
  }
}
