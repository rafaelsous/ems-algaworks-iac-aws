variable "db_subnet_group_name" {
  description = "The name of the RDS DB subnet group"
  type        = string
}

variable "db_parameter_group_name" {
  description = "The name of the RDS DB parameter group"
  type        = string
}

variable "db_parameter_group_options" {
  description = "Additional options for the RDS DB parameter group"
  type        = map(string)
}

variable "db_engine" {
  description = "The database engine for the RDS instance"
  type        = string
}

variable "db_engine_version" {
  description = "The database engine version for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS DB instance"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_username" {
  description = "The username for the RDS DB instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes for the RDS DB instance"
  type        = number
  default     = 20
}

variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS DB instance"
  type        = string
}

variable "db_port" {
  description = "The port on which the DB instance accepts connections"
  type        = number
}

variable "db_subnet_ids" {
  description = "The subnet IDs for the RDS DB subnet group"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
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
}

variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be launched"
  type        = string
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups for the RDS instance"
  type        = number
  default     = 1
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-04:00"
}

variable "db_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "Mon:00:00-Mon:01:00"
}