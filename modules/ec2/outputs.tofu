output "id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.main.arn
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_eip.main[0].public_ip
}

output "key_pair_arn" {
  description = "The ARN of the key pair"
  value       = aws_key_pair.main.arn
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.main.id
}