module "database" {
  source = "../../modules/rds"

  db_name                = var.db_name
  db_instance_identifier = "${var.environment}-${var.db_instance_identifier}"
  db_engine              = var.db_engine
  db_engine_version      = var.db_engine_version
  db_instance_class      = var.db_instance_class
  db_username            = var.db_username
  db_allocated_storage   = var.db_allocated_storage
  db_skip_final_snapshot = var.db_skip_final_snapshot
  db_port                = local.db_port

  vpc_id                   = module.vpc.vpc_id
  db_subnet_ids            = module.vpc.subnet_private_ids["database"]
  db_subnet_group_name     = var.db_subnet_group_name
  db_security_group_config = local.db_security_group_config

  db_parameter_group_name    = var.db_parameter_group_name
  db_parameter_group_options = var.db_parameter_group_options

  db_backup_retention_period = var.db_backup_retention_period
  db_backup_window           = var.db_backup_window
  db_maintenance_window      = var.db_maintenance_window

  common_tags = merge(
    local.common_tags, {
      Name = "${var.environment}-${var.db_instance_identifier}"
  })
}