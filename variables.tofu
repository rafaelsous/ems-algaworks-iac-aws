variable "aws_region" {
  description = "The region where the S3 bucket will be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment for the S3 bucket (Development, Homolog, Production)"
  type        = string
  default     = "Development"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "172.25.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "algadelivery-vpc"
}

variable "subnet_pub_config" {
  type = map(object({
    cidr_block = string
    az : string
    name : string
  }))
  default = {
    "public_a" = {
      cidr_block = "172.25.1.0/24"
      az         = "a"
      name       = "Subnet Public A"
    },
    "public_b" = {
      cidr_block = "172.25.2.0/24"
      az         = "b"
      name       = "Subnet Public B"
    },
    "public_c" = {
      cidr_block = "172.25.3.0/24"
      az         = "c"
      name       = "Subnet Public C"
  } }
}