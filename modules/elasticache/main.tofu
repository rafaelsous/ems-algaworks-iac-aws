resource "aws_elasticache_serverless_cache" "main" {
  name        = var.name
  description = var.description

  engine               = var.engine
  major_engine_version = var.major_engine_version

  cache_usage_limits {
    data_storage {
      minimum = var.data_storage.minimum
      maximum = var.data_storage.maximum
      unit    = var.data_storage.unit
    }
    ecpu_per_second {
      minimum = var.request_ecpu_per_second.minimum
      maximum = var.request_ecpu_per_second.maximum
    }
  }

  security_group_ids = [aws_security_group.main.id]
  subnet_ids         = var.subnet_ids

  daily_snapshot_time      = var.daily_snapshot_time
  snapshot_retention_limit = var.snapshot_retention_limit

  tags = merge(var.common_tags, {
    Name = var.name
  })

  lifecycle {
    prevent_destroy = true
  }
}