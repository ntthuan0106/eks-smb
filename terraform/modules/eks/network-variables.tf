variable "vpc_eks_name" {
  type = string
  description = "VPC name"
}

variable "eks_cidr_block" {
  type = string
  description = "EkS CIDR block"
  default = "172.16.0.0/16"
}

variable "amount_of_pub_subnet"{
    type = number
    default = 2
    description = "Number public subnets in cluster"
    validation {
      condition = var.amount_of_pub_subnet >=2
      error_message = "Specify at list 2 public subnet"
    }
}

variable "amount_of_private_subnet"{
    type = number
    default = 2
    description = "Number private subnets in cluster"
    validation {
      condition = var.amount_of_private_subnet >=2
      error_message = "Specify at list 2 private subnet"
    }
}

variable "region"{
    type = string
    description = "EKS located region"
}

variable "enabled_ELB" {
  type = bool
  default = true
  description = "Enable Elastic Load Balancing"
}