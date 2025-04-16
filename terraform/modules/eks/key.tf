resource "aws_key_pair" "eks_key_pair" {
  key_name = var.key_pair_name
  public_key = tls_private_key.node_group_private_key.public_key_openssh
}

resource "tls_private_key" "node_group_private_key" {
  algorithm = var.key_algorithm
}