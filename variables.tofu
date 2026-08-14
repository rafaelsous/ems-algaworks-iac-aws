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
  }))
  default = {
    "public_a" = {
      cidr_block = "172.25.1.0/24"
      az         = "a"
    },
    "public_b" = {
      cidr_block = "172.25.2.0/24"
      az         = "b"
    },
    "public_c" = {
      cidr_block = "172.25.3.0/24"
      az         = "c"
  } }
}

variable "subnet_private_management_config" {
  type = map(object({
    cidr_block = string
    az : string
  }))
  default = {
    "private_a" = {
      cidr_block = "172.25.4.0/24"
      az         = "a"
    },
    "private_b" = {
      cidr_block = "172.25.5.0/24"
      az         = "b"
    },
    "private_c" = {
      cidr_block = "172.25.6.0/24"
      az         = "c"
    }
  }
}

variable "subnet_private_cluster_config" {
  type = map(object({
    cidr_block = string
    az : string
  }))
  default = {
    "private_a" = {
      cidr_block = "172.25.7.0/24"
      az         = "a"
    },
    "private_b" = {
      cidr_block = "172.25.8.0/24"
      az         = "b"
    },
    "private_c" = {
      cidr_block = "172.25.9.0/24"
      az         = "c"
    }
  }
}

variable "ngw_regional_mode" {
  description = "Is the NAT Gateway in regional mode? (true for regional, false for zonal)"
  type        = bool
  default     = true
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
  default     = "algadelivery-tofu"
}