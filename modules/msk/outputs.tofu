output "arn" {
  description = "The ARN of the MSK cluster"
  value       = aws_msk_serverless_cluster.main.arn
}

output "bootstrap_brokers_sasl_iam" {
  description = "The endpoint of the MSK cluster"
  value       = aws_msk_serverless_cluster.main.bootstrap_brokers_sasl_iam
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.main.id
}