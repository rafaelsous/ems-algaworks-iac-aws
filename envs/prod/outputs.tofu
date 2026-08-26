output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "subnet_public_ids" {
  description = "The IDs of the public subnet"
  value       = module.vpc.subnet_public_ids["public"]
}

output "subnet_public_arns" {
  description = "The ARNs of the public subnet"
  value       = module.vpc.subnet_public_arns["public"]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.vpc.internet_gateway_arn
}

output "subnet_private_management_ids" {
  description = "The IDs of the private management subnet"
  value       = module.vpc.subnet_private_ids["management"]
}

output "subnet_private_management_arns" {
  description = "The ARNs of the private management subnet"
  value       = module.vpc.subnet_private_arns["management"]
}

output "subnet_private_cluster_ids" {
  description = "The IDs of the private cluster subnet"
  value       = module.vpc.subnet_private_ids["cluster"]
}

output "subnet_private_cluster_arns" {
  description = "The ARNs of the private cluster subnet"
  value       = module.vpc.subnet_private_arns["cluster"]
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

output "route_table_public_id" {
  description = "The ID of the public route table"
  value       = module.vpc.route_table_public_id
}

output "route_table_private_id" {
  description = "The ID of the private route table"
  value       = module.vpc.route_table_private_id
}

output "bastion_id" {
  description = "The ID of the bastion EC2 instance"
  value       = module.bastion.id
}

output "bastion_arn" {
  description = "The ARN of the bastion EC2 instance"
  value       = module.bastion.arn
}

output "bastion_public_ip" {
  description = "The public IP of the bastion EC2 instance"
  value       = module.bastion.public_ip
}

output "key_pair_arn" {
  description = "The ARN of the key pair"
  value       = module.bastion.key_pair_arn
}

output "bastion_security_group_id" {
  description = "The ID of the bastion security group"
  value       = module.bastion.security_group_id
}

output "db_password_arn" {
  value = module.database.db_password_arn
}

output "db_endpoint" {
  value = module.database.db_endpoint
}

output "db_instance_id" {
  value = module.database.db_instance_id
}

output "db_instance_arn" {
  value = module.database.db_instance_arn
}

output "elasticache_endpoint_address" {
  value = module.elasticache.endpoint_address
}

output "elasticache_endpoint_port" {
  value = module.elasticache.endpoint_port
}

output "elasticache_read_endpoint_address" {
  value = module.elasticache.reader_endpoint_address
}

output "elasticache_read_endpoint_port" {
  value = module.elasticache.reader_endpoint_port
}

output "elasticache_arn" {
  value = module.elasticache.arn
}

output "elasticache_status" {
  value = module.elasticache.status
}

output "elasticache_security_group_id" {
  value = module.elasticache.security_group_id
}