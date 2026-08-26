variable "aws_region" {
  description = "The region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment for the S3 bucket (Development, Homolog, Production)"
  type        = string
  default     = "development"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "172.25.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "algadelivery-vpc"
}

variable "subnet_public_config" {
  description = "Configuration for public subnets grouped by name (e.g., public)"
  type = map(map(object({
    cidr_block = string
    az : string
  })))
  default = {
    public = {
      "pub_a" = { cidr_block = "172.25.1.0/24", az = "a" },
      "pub_b" = { cidr_block = "172.25.2.0/24", az = "b" },
      "pub_c" = { cidr_block = "172.25.3.0/24", az = "c" }
    }
  }
}

variable "subnet_private_config" {
  description = "Configuration for private subnets grouped by name (e.g., management, cluster)"
  type = map(map(object({
    cidr_block = string
    az : string
  })))
  default = {
    management = {
      "private_mgmt_a" = { cidr_block = "172.25.4.0/24", az = "a" },
      "private_mgmt_b" = { cidr_block = "172.25.5.0/24", az = "b" },
      "private_mgmt_c" = { cidr_block = "172.25.6.0/24", az = "c" }
    },
    cluster = {
      "private_cluster_a" = { cidr_block = "172.25.7.0/24", az = "a" },
      "private_cluster_b" = { cidr_block = "172.25.8.0/24", az = "b" },
      "private_cluster_c" = { cidr_block = "172.25.9.0/24", az = "c" }
    },
    database = {
      "private_db_a" = { cidr_block = "172.25.10.0/24", az = "a" },
      "private_db_b" = { cidr_block = "172.25.11.0/24", az = "b" },
      "private_db_c" = { cidr_block = "172.25.12.0/24", az = "c" }
    }
  }
}

variable "ngw_regional_mode" {
  description = "Is the NAT Gateway in regional mode? (true for regional, false for zonal)"
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
  default     = "algadelivery-tofu"
}

variable "bastion_security_group_config" {
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
  default = null
}

variable "db_subnet_group_name" {
  description = "The name of the RDS DB subnet group"
  type        = string
  default     = "algadelivery-db-subnet-group"
}

variable "db_parameter_group_name" {
  description = "The name of the RDS DB parameter group"
  type        = string
  default     = "algadelivery-db-parameter-group"
}

variable "db_parameter_group_options" {
  description = "Additional options for the RDS DB parameter group"
  type        = map(string)
  default = {
    max_connections          = "300"
    shared_preload_libraries = "pg_stat_statements,pgaudit"
  }
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The database engine version for the RDS instance"
  type        = string
  default     = "18"
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "delivery"
}

variable "db_instance_class" {
  description = "The instance class for the RDS DB instance"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_username" {
  description = "The username for the RDS DB instance"
  type        = string
  default     = "postgres"
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes for the RDS DB instance"
  type        = number
  default     = 20
}

variable "db_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS DB instance"
  type        = string
  default     = "algadelivery-db"
}

variable "db_port" {
  description = "The port on which the DB instance accepts connections"
  type        = number
  default     = 5432
}

variable "db_security_group_config" {
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
  default = null
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups for the RDS instance"
  type        = number
  default     = 1
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "04:00-05:00"
}

variable "db_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "Mon:01:00-Mon:02:00"
}

variable "elasticache_name" {
  description = "The name of the ElastiCache serverless cache"
  type        = string
  default     = "algadelivery-cache"
}

variable "elasticache_description" {
  description = "The description of the ElastiCache serverless cache"
  type        = string
  default     = "ElastiCache serverless cache for algadelivery"
}

variable "elasticache_engine" {
  description = "The cache engine for the ElastiCache serverless cache"
  type        = string
  default     = "valkey"
}

variable "elasticache_major_engine_version" {
  description = "The cache engine version for the ElastiCache serverless cache"
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
  default     = 0
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
  default = null
}

variable "msk_security_group_config" {
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
  default = null
}