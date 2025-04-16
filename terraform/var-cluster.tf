variable "cluster_name" {
  type = string
}
variable "vpc_eks_name" {
  type = string
}
variable "region" {
  type = string
}

variable "k8s_version" {
  type = string
}
variable "ami_id_name" {
  type = string
}

variable "arn_cluster_role" {
  type = string
}
variable "arn_node_role" {
  type = string
  description = "Node role"
}

variable "node_group_name" {
  type = string
}
variable "prefix_name" {
  type = string
}
variable "key_pair_name" {
  type = string
}
variable "domain_name" {
  type = string
}