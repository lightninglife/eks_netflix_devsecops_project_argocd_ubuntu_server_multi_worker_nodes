output "eks_cluster_netflix_name" {
  value = aws_eks_cluster.netflix.id
}

output "eks_cluster_netflix" {
  value = aws_eks_cluster.netflix
}
 
output "eks_cluster_netflix_url" {
  value = aws_eks_cluster.netflix.identity[0].oidc[0].issuer
}

output "eks_cluster_netflix_endpoint" {
    value = aws_eks_cluster.netflix.endpoint
}

output "eks_cluster_netflix_certificate_authority" {
    value = aws_eks_cluster.netflix.certificate_authority
}

output "eks_nodegroup_netflix_name" {
    value = aws_eks_node_group.netflix.id
}

data "aws_eks_cluster" "eks_cluster_netflix" {
  name = aws_eks_cluster.netflix.name # Replace with your EKS cluster name

  depends_on = [aws_eks_cluster.netflix]
}

output "eks_cluster_security_group_ids" {
  value = data.aws_eks_cluster.eks_cluster_netflix.vpc_config[0].security_group_ids
}

output "eks_asg_name" {
  value = aws_eks_node_group.netflix.resources.0.autoscaling_groups.0.name
}