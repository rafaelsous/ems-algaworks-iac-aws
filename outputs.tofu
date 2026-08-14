output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.algadelivery.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.algadelivery.arn
}

output "subnet_public_id" {
  description = "The IDs of the public subnet"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "subnet_public_arn" {
  description = "The ARNs of the public subnet"
  value       = [for subnet in aws_subnet.public : subnet.arn]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.algadelivery.id
}

output "internet_gateway_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.algadelivery.arn
}

output "subnet_private_management_id" {
  description = "The IDs of the private management subnet"
  value       = [for subnet in aws_subnet.private_management : subnet.id]
}

output "subnet_private_management_arn" {
  description = "The ARNs of the private management subnet"
  value       = [for subnet in aws_subnet.private_management : subnet.arn]
}

output "subnet_private_cluster_id" {
  description = "The IDs of the private cluster subnet"
  value       = [for subnet in aws_subnet.private_cluster : subnet.id]
}

output "subnet_private_cluster_arn" {
  description = "The ARNs of the private cluster subnet"
  value       = [for subnet in aws_subnet.private_cluster : subnet.arn]
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.algadelivery.id
}

output "route_table_public_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "route_table_private_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}