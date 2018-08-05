#--------------------------------------------------------------
# Common - Key
#--------------------------------------------------------------
variable "key" {
  type = "map"

  default = {
    # default
    default.credentials_profile = "default"
  }
}

#--------------------------------------------------------------
# Common - Prefix
#--------------------------------------------------------------
variable "prefix" {
  type = "map"

  default = {
    # default
    default.prefix = "1st-issue-"
  }
}
