output "eks_netflix_cluster_iam_role_arn" {
  value = aws_iam_role.eks_cluster_netflix.arn
}

output "eks_netflix_nodegroup_iam_role_arn" {
  value = aws_iam_role.eks_nodegroup_role_netflix.arn
}

# output "eks_netflix_nodegroup_instance_iam_role_arn" {
#   value = aws_iam_instance_profile.eks_instance_profile.arn
# }

output "eks_worker_node_policy_attachment_netflix" {
  value = var.aws_iam_policy_attachment_eks_worker_node_policy_policy_arn
}

output "eks_cni_policy_attachment_netflix" {
  value = var.aws_iam_policy_attachment_eks_cni_policy_policy_arn
}

output "eks_ec2_container_registry_readonly_attachment_netflix" {
  value = var.aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.cluster.arn
}

output "eks_AmazonEKSClusterPolicy" {
  value = aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy
}

output "eks_AmazonEKSVPCResourceController" {
  value = aws_iam_role_policy_attachment.eks_AmazonEKSVPCResourceController
}