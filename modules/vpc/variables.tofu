variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "subnet_pub_config" {
  description = "Configuration for public subnets"
  type = map(object({
    cidr_block = string
    az : string
  }))
}

variable "context_name" {
  description = "The context name for tagging resources"
  type        = string
}

variable "subnet_private_management_config" {
  description = "Configuration for private management subnets"
  type = map(object({
    cidr_block = string
    az : string
  }))
}

variable "subnet_private_cluster_config" {
  description = "Configuration for private cluster subnets"
  type = map(object({
    cidr_block = string
    az : string
  }))
}

variable "ngw_regional_mode" {
  description = "Is the NAT Gateway in regional mode? (true for regional, false for zonal)"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}