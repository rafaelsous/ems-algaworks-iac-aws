output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.algadelivery-test-tofu.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.algadelivery-test-tofu.arn
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = aws_s3_bucket.algadelivery-test-tofu.bucket_regional_domain_name
}