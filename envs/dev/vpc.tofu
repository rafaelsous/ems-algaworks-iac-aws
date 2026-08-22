module "vpc" {
  source = "../../modules/vpc"

  aws_region            = var.aws_region
  vpc_name              = "${var.environment}-${local.context_name}-vpc"
  context_name          = local.context_name
  vpc_cidr_block        = var.vpc_cidr_block
  subnet_public_config  = var.subnet_public_config
  subnet_private_config = var.subnet_private_config
  ngw_regional_mode     = local.ngw_regional_mode
  common_tags           = local.common_tags
}