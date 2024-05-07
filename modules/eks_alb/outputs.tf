# # Helm Release Outputs
# output "lbc_helm_metadata" {
#   description = "Metadata Block outlining status of the deployed release."
#   value = helm_release.loadbalancer_controller.metadata
# }

output "lbc_iam_role_arn" {
  description = "AWS Load Balancer Controller IAM Role ARN"
  value = aws_iam_role.lbc_iam_role.arn
}

output "lbc_iam_policy" {
  #value = data.http.lbc_iam_policy.body
  value = data.http.lbc_iam_policy.response_body
}

output "lbc_iam_policy_arn" {
  value = aws_iam_policy.lbc_iam_policy.arn 
}

output "alb_dns_name" {
  value = data.aws_lb.eks.dns_name
}


output "aws_instance_eks_netflix_private_ips" {
  value = data.aws_instances.eks_netflix.private_ips
}