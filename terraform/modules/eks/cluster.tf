resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = var.arn_cluster_role
  vpc_config {
    subnet_ids = concat(
      aws_subnet.subnet_pub[*].id,
      )
  }
  version = var.k8s_version
  bootstrap_self_managed_addons = true
  tags = {
    "user" = "thuan"
  }
}

resource "aws_eks_node_group" "EKS_node_group" {
  cluster_name = aws_eks_cluster.cluster.name
  node_group_name_prefix = "${var.cluster_name}-"

  subnet_ids = concat(
    aws_subnet.subnet_pub[*].id,
  )

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }
  version = aws_eks_cluster.cluster.version
  instance_types = var.eks_instance_types
  node_role_arn  = var.arn_node_role
  
  tags = {
    "Name" = "${var.cluster_name}-node"
  }
}

resource "aws_eks_addon" "eks_addon" {
  for_each = { for addon in var.eks_addon_list : addon.name => addon }

  cluster_name  = aws_eks_cluster.cluster.name
  addon_name    = each.value.name
  addon_version = each.value.version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

