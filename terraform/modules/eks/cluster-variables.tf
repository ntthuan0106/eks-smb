variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}
variable "arn_cluster_role" {
  type = string
  description = "Cluster role"
}
variable "arn_node_role" {
  type = string
  description = "Node role"
}
variable "k8s_version" {
  type = string
  description = "K8s version"
}
variable "node_group_name"{
    type = string
    description = "EKS node group name"
}
variable "desired_size" {
  type = number
  default = 1
  description = "Desire EKS node"
}
variable "min_size" {
  type = number
  default = 1
  description = "Min EKS node"
}
variable "max_size" {
  type = number
  default = 2
  description = "Max EKS nodes"

}
variable "eks_addon_list" {
  type = list(object({
    name =string
    version = optional(string)
  }))
}
variable "eks_instance_types" {
  type = list(string)
  description = "EKS instance types"
  default = ["t3.medium"]
}
variable "node_instance_type" {
  type = string
  description = "Node instance type"
  default = "t3.medium"
}
variable "ami_id_name" {
  type = string
  description = "AMI id"
}
variable "prefix_name" {
  type = string
  description = "Instance template prefix name"
}

