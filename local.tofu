locals {
  context_name        = "algadelivery"
  ngw_regional_mode   = var.ngw_regional_mode ? "regional" : "zonal"
  internet_cidr_block = "0.0.0.0/0"
  my_public_ip        = "${chomp(data.http.my_public_ip.response_body)}/32"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "OpenTofu"
  }

  bastion_security_group_config = var.bastion_security_group_config != null ? var.bastion_security_group_config : {
    name        = "bastion_sg"
    description = "Security group for the bastion host"

    ingress_rules = [
      {
        description = "Allow SSH from the internet"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [local.my_public_ip]
      },
      {
        description = "Allow HTTP from the internet"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
      },
      {
        description = "Allow HTTPS from the internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [local.internet_cidr_block]
      }
    ]
  }
}