module "vpc" {
  source = "./modules/vpc"

  aws_region                       = var.aws_region
  vpc_name                         = "${local.context_name}-vpc"
  context_name                     = local.context_name
  vpc_cidr_block                   = var.vpc_cidr_block
  subnet_pub_config                = var.subnet_pub_config
  subnet_private_cluster_config    = var.subnet_private_cluster_config
  subnet_private_management_config = var.subnet_private_management_config
  ngw_regional_mode                = local.ngw_regional_mode
  common_tags                      = local.common_tags
}