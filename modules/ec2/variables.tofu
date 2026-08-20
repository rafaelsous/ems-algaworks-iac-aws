variable "name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instances"
  type        = string
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

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be launched"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "enabled_eip" {
  description = "Whether to enable an Elastic IP for the EC2 instance"
  type        = bool
  default     = true
}