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
    default.prefix = "first-issue-"
  }
}

#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------
variable "vpc" {
  type = "map"

  default = {
    # default
    default.vpc_cidr = "192.168.0.0/16"
  }
}

#--------------------------------------------------------------
# Subnet
#--------------------------------------------------------------
variable "subnet" {
  type = "map"

  default = {
    # cidr

    ## public
    default.pub_subnet_a_cidr = "192.168.0.0/24"
    default.pub_subnet_c_cidr = "192.168.1.0/24"

    ## private
    default.priv_subnet_a_cidr = "192.168.10.0/24"
    default.priv_subnet_c_cidr = "192.168.11.0/24"

    # subnet

    ## public
    default.pub_subnet_a_name = "pub-subnet.apne-1a"
    default.pub_subnet_c_name = "pub-subnet.apne-1c"
    ## private
    default.priv_subnet_a_name = "priv-subnet.apne-1a"
    default.priv_subnet_c_name = "priv-subnet.apne-1c"
  }
}

#--------------------------------------------------------------
# Route table
#--------------------------------------------------------------
variable "route_table" {
  type = "map"

  default = {
    ## public
    default.pub_subnet_route_table_name = "pub-rt.apne-1"

    ## private
    default.priv_subnet_route_table_name = "priv-rt.apne-1"
  }
}
