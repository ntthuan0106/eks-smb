provider "aws" {
  # Configuration options
  access_key = var.access_key
  secret_key = var.secret_key
}
# provider "helm" {
#   # Configuration options
#   kubernetes = {
#     host = module.vpc_eks.eks_endpoint
#     cluster_ca_certificate = base64decode(module.vpc_eks.cluster_ca_certificate)
#     exec = {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
#       command     = "aws"
#     }
#   }
# }