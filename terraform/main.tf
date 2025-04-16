module "vpc_eks" {
  source           = "./modules/eks"
  
  cluster_name     = var.cluster_name
  vpc_eks_name     = var.vpc_eks_name
  region           = var.region

  k8s_version = var.k8s_version
  ami_id_name = var.ami_id_name
  
  arn_cluster_role = var.arn_cluster_role
  arn_node_role = var.arn_cluster_role

  node_group_name  = var.node_group_name
  desired_size = 2
  min_size = 2
  max_size = 5
  
  # eks_addon_list = [
  #   { name = "vpc-cni", },
  #   { name = "coredns",  },
  #   { name = "kube-proxy",   },
  #   { name = "metrics-server",  },
  # ]
  eks_addon_list = [
    { name = "vpc-cni", version = "v1.19.3-eksbuild.1" },
    { name = "coredns", version = "v1.11.4-eksbuild.2" },
    { name = "kube-proxy", version = "v1.32.0-eksbuild.2"  },
    { name = "metrics-server", version = "v0.7.2-eksbuild.2" },
    { name = "aws-ebs-csi-driver",},
    { name = "aws-efs-csi-driver",},
    { name = "aws-mountpoint-s3-csi-driver",},
    { name = "snapshot-controller",},
  ]
  prefix_name= var.prefix_name
  key_pair_name = var.key_pair_name
}

module "host_zone" {
  source = "./modules/ACM"
  domain_name = var.domain_name
}
resource "local_file" "ssh_key_file" {
  content         = module.vpc_eks.ssh_pub_key
  filename        = "${path.module}/../.ssh/ssh_key.pem"
  file_permission = "0600"
}
data "aws_acm_certificate" "name" {
  domain = var.domain_name
  depends_on = [ module.host_zone ]
}
# resource "helm_release" "ingress-nginx" {
#     name             = "ingress-nginx"
#     repository       = "https://kubernetes.github.io/ingress-nginx"
#     chart            = "ingress-nginx"
#     namespace        = "ingress-nginx"
#     create_namespace = true
#     version          = "4.10.0"
#     values           = [file("../k8s/nginx-values.yml")]
#     set = [
#         {
#         name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-cert"
#         value = data.aws_acm_certificate.name.arn
#         type  = "string"
#         },
#     ]
# }