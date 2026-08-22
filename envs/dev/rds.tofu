resource "aws_db_subnet_group" "algadelivery" {
  name        = var.db_subnet_group_name
  description = "Subnet group for the RDS instance"
  subnet_ids  = module.vpc.subnet_private_ids["database"]

  tags = merge(
    local.common_tags, {
      Name = var.db_subnet_group_name
  })
}

resource "aws_db_parameter_group" "algadelivery" {
  name        = var.db_parameter_group_name
  description = "Parameter group for the RDS instance"
  family      = "${var.db_engine}${var.db_engine_version}"

  dynamic "parameter" {
    for_each = var.db_parameter_group_options
    content {
      name         = parameter.key
      value        = parameter.value
      apply_method = "pending-reboot"
    }
  }

  tags = merge(
    local.common_tags, {
      Name = var.db_parameter_group_name
    }
  )
}

resource "aws_security_group" "algadelivery_rds" {
  name        = "${var.environment}-algadelivery-rds-sg"
  description = "Security group for the RDS instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow PostgreSQL from the bastion host"
    from_port   = local.db_port
    to_port     = local.db_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.internet_cidr_block]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.common_tags, {
      Name = "${var.environment}-${local.context_name}-rds_sg"
  })
}

resource "random_password" "db_password" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "algadelivery" {
  identifier        = "${var.environment}-${local.context_name}-db"
  db_name           = var.db_name
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage

  username                    = var.db_username
  manage_master_user_password = true
  port                        = local.db_port

  parameter_group_name   = aws_db_parameter_group.algadelivery.name
  db_subnet_group_name   = aws_db_subnet_group.algadelivery.name
  vpc_security_group_ids = [aws_security_group.algadelivery_rds.id]

  multi_az = var.db_multi_az

  skip_final_snapshot = var.db_skip_final_snapshot

  apply_immediately = true
}

output "db_password_arn" {
  value = aws_db_instance.algadelivery.master_user_secret[0].secret_arn
}

output "db_endpoint" {
  value = aws_db_instance.algadelivery.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.algadelivery.id
}

output "db_instance_arn" {
  value = aws_db_instance.algadelivery.arn
}