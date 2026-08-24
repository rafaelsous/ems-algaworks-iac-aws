resource "aws_elasticache_serverless_cache" "main" {
  name        = var.elasticache_name
  description = var.elasticache_description

  engine               = var.elasticache_engine
  major_engine_version = var.elasticache_major_engine_version

  cache_usage_limits {
    data_storage {
      minimum = var.elasticache_data_storage.minimum
      maximum = var.elasticache_data_storage.maximum
      unit    = var.elasticache_data_storage.unit
    }
    ecpu_per_second {
      minimum = var.elasticache_request_ecpu_per_second.minimum
      maximum = var.elasticache_request_ecpu_per_second.maximum
    }
  }

  security_group_ids = [aws_security_group.main.id]
  subnet_ids         = var.elasticache_subnet_ids

  daily_snapshot_time      = var.elasticache_daily_snapshot_time
  snapshot_retention_limit = var.elasticache_snapshot_retention_limit

  tags = merge(var.common_tags, {
    Name = var.elasticache_name
  })

  lifecycle {
    prevent_destroy = true
  }
}