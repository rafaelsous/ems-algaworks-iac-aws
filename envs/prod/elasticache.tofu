module "elasticache" {
  source = "../../modules/elasticache"

  elasticache_name                 = var.elasticache_name
  elasticache_description          = var.elasticache_description
  elasticache_engine               = var.elasticache_engine
  elasticache_major_engine_version = var.elasticache_major_engine_version

  elasticache_daily_snapshot_time      = var.elasticache_daily_snapshot_time
  elasticache_snapshot_retention_limit = var.elasticache_snapshot_retention_limit
  elasticache_request_ecpu_per_second  = var.elasticache_request_ecpu_per_second
  elasticache_data_storage             = var.elasticache_data_storage

  vpc_id                            = module.vpc.vpc_id
  elasticache_subnet_ids            = module.vpc.subnet_private_ids["management"]
  elasticache_security_group_config = local.elasticache_security_group_config


  common_tags = merge(
    local.common_tags, {
      Name = "${var.environment}-${var.elasticache_name}"
  })
}