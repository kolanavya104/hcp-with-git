data "aws_vpc" "existing" {
  id = var.vpc_id
}

data "aws_subnet" "existing" {
  id = var.subnet_id
}

data "aws_security_group" "existing" {
  id = var.security_group_id
}
