module "elasticache" {
  source = "../../modules/elasticache"

  name                 = "${var.environment}-${local.context_name}"
  description          = "ElastiCache instance for ${var.environment} environment"
  engine               = "valkey"
  major_engine_version = var.elasticache_major_engine_version

  daily_snapshot_time      = var.elasticache_daily_snapshot_time
  snapshot_retention_limit = var.elasticache_snapshot_retention_limit
  request_ecpu_per_second  = var.elasticache_request_ecpu_per_second
  data_storage             = var.elasticache_data_storage

  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.subnet_private_ids["management"]
  security_group_config = local.elasticache_security_group_config


  common_tags = merge(
    local.common_tags, {
      Name = "${var.environment}-${local.context_name}"
    }
  )
}