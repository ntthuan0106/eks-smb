output "list_pub_subnet_id" {
  value = aws_subnet.subnet_pub[*].id
}
output "list_private_subnet_id" {
  value = aws_subnet.subnet_private[*].id
}
output "ssh_pub_key" {
  value = tls_private_key.node_group_private_key.public_key_openssh
}
output "eks_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}
output "cluster_ca_certificate" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}