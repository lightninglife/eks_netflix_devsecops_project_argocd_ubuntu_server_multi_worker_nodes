output "cluster_ca_certificate" {
  value     = base64decode(data.aws_eks_cluster.certificate_authority.certificate_authority[0].data)
  sensitive = true
}

output "host" {
  value = data.external.api_server_endpoint.result["api_endpoint"]
}

# output "eks_asg_instance_ids" {
#   value = data.aws_instance.eks_worker_node.id
# }

# output "output_argocd_admin_password" {
#   value = module.eks_alb.output_argocd_admin_password
# }

output "aws_instance_eks_netflix_private_ips" {
  value = module.eks_alb.aws_instance_eks_netflix_private_ips
}