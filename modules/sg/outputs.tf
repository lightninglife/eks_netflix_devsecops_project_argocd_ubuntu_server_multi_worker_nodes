output "security_group_id" {
  value = aws_security_group.all.id
}

output "security_group_ids" {
  value = [aws_security_group.all.id]
}

output "security_group_id_eks_cluster" {
  value = aws_security_group.eks_cluster.id
}