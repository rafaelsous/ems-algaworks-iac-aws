module "msk" {
  source = "../../modules/msk"

  cluster_name = "${var.environment}-${local.context_name}"

  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.subnet_private_ids["management"]
  security_group_config = local.msk_security_group_config

  common_tags = merge(
    local.common_tags, {
      Name = "${var.environment}-${local.context_name}"
    }
  )
}