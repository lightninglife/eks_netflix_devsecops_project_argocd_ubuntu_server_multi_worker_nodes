output "argocd_dns_name" {
  value = data.aws_lb.argocd.dns_name
}

output "argocd_password" {
  value     = data.aws_s3_object.argocd_netfilx.body
  sensitive = true
}