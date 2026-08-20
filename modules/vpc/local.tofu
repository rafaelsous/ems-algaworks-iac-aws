locals {
  internet_cidr_block = "0.0.0.0/0"

  subnet_public_config = merge([
    for group_name, subnets in var.subnet_public_config : {
      for subnet_key, subnet in subnets : subnet_key => merge(subnet, { group = group_name })
    }
  ]...)

  subnet_private_config = merge([
    for group_name, subnets in var.subnet_private_config : {
      for subnet_key, subnet in subnets : subnet_key => merge(subnet, { group = group_name })
    }
  ]...)
}