variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "algadelivery-test-tofu"
}

variable "environment" {
  description = "The environment for the S3 bucket (Development, Homolog, Production)"
  type        = string
  default     = "Development"
}

variable "bucket_versioning" {
  description = "The versioning status for the S3 bucket (Enabled or Suspended or Disabled)"
  type        = string
  default     = "Enabled"
}

variable "aws_region" {
  description = "The region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}