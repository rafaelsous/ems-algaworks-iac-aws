variable "cluster_name" {
  description = "The name of the MSK cluster"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets in which the MSK cluster will be deployed"
  type        = list(string)
}

variable "security_group_config" {
  type = object({
    name        = string
    description = string

    ingress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))

    egress_rules = list(object({
      description = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}

variable "vpc_id" {
  description = "The ID of the VPC in which the MSK cluster will be deployed"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}