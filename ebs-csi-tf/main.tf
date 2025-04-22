data "aws_eks_cluster" "eks_cluster" {
  name = "thuan-eks"
}

module "eks-ebs-csi" {
  source  = "mrnim94/eks-ebs-csi/aws"
  version = "2.1.1"

  aws_region = "us-east-1"

  eks_cluster_certificate_authority_data = data.aws_eks_cluster.eks_cluster.certificate_authority[0].data
  eks_cluster_endpoint = data.aws_eks_cluster.eks_cluster.endpoint
  eks_cluster_name = data.aws_eks_cluster.eks_cluster.name
  aws_iam_openid_connect_provider_arn = "arn:aws:iam::492804330065:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/1E025760070620269658C02245209BEC"
  create_ebs_storage_class = true
}
