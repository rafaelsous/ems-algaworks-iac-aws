resource "aws_security_group" "algadelivery" {
  name        = "${var.environment}-algadelivery-msk"
  description = "Security group for the MSK cluster"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 9098
    to_port     = 9098
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

  tags = merge(local.common_tags, {
    Name = "${var.environment}-algadelivery-msk"
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_msk_serverless_cluster" "algadelivery" {
  cluster_name = "${var.environment}-algadelivery-msk"

  vpc_config {
    subnet_ids         = module.vpc.subnet_private_ids["management"]
    security_group_ids = [aws_security_group.algadelivery.id]
  }

  client_authentication {
    sasl {
      iam {
        enabled = true
      }
    }
  }

  tags = merge(local.common_tags, {
    Name = "${var.environment}-algadelivery-msk"
  })

  lifecycle {
    prevent_destroy = true
  }
}

output "msk_cluster_name" {
  description = "The name of the MSK cluster"
  value       = aws_msk_serverless_cluster.algadelivery.cluster_name
}

output "msk_arn" {
  description = "The ARN of the MSK cluster"
  value       = aws_msk_serverless_cluster.algadelivery.arn
}

output "msk_endpoint" {
  description = "The endpoint of the MSK cluster"
  value       = aws_msk_serverless_cluster.algadelivery.bootstrap_brokers_sasl_iam
}
