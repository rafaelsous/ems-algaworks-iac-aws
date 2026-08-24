variable "elasticache_name" {
  description = "The name of the ElastiCache serverless cache"
  type        = string
}

variable "elasticache_description" {
  description = "The description of the ElastiCache serverless cache"
  type        = string
}

variable "elasticache_engine" {
  description = "The engine for the ElastiCache serverless cache"
  type        = string
  default     = "valkey"
}

variable "elasticache_major_engine_version" {
  description = "The major engine version for the ElastiCache serverless cache"
  type        = string
  default     = "9"
}

variable "elasticache_daily_snapshot_time" {
  description = "The daily time range during which automated snapshots are created"
  type        = string
  default     = "02:00"
}

variable "elasticache_snapshot_retention_limit" {
  description = "The number of days to retain snapshots for the ElastiCache serverless cache"
  type        = number
  default     = 1
}

variable "elasticache_request_ecpu_per_second" {
  description = "The maximum number of eCPU per second for the ElastiCache serverless cache"
  type = object({
    minimum = number
    maximum = number
  })
  default = {
    minimum = 1000
    maximum = 5000
  }
}

variable "elasticache_data_storage" {
  description = "The maximum data storage in GB for the ElastiCache serverless cache"
  type = object({
    minimum = number
    maximum = number
    unit    = string
  })
  default = {
    minimum = 1
    maximum = 10
    unit    = "GB"
  }
}

variable "elasticache_security_group_config" {
  type = object({
    name        = string
    description = string

    ingress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    egress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}

variable "elasticache_subnet_ids" {
  description = "The subnet IDs for the RDS DB subnet group"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be launched"
  type        = string
}