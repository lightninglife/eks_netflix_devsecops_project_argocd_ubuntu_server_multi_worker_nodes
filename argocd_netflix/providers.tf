provider "argocd" {
  server_addr = "${data.aws_lb.argocd.dns_name}:80" # Replace with your ArgoCD server address
  username    = "admin"                             # Replace with your ArgoCD username
  password    = data.aws_s3_object.argocd_netfilx.body
  # auth_token                  = "6yTZadKUz/RrV8j7TwIGeh88qzOJ6UARST+KwpPkv8k="
  insecure = true
  # port_forward_with_namespace = "argocd"
  # port_forward = true
  plain_text = true
  grpc_web   = true
  # kubernetes {
  #   host                   = data.external.api_server_endpoint.result["api_endpoint"]
  #   cluster_ca_certificate = base64decode(data.aws_eks_cluster.certificate_authority.certificate_authority[0].data)
  #   token                  = data.aws_eks_cluster_auth.cluster.token
  # }
}

# "password"                    # Replace with your ArgoCD password or API token
# You can also provide token in place of password like below:
# token          = "your-argocd-token"
# Optionally, you can specify other configurations like client timeouts, etc.


# # Terraform Kubernetes Provider
# provider "kubernetes" {
#   host                   = data.external.api_server_endpoint.result["api_endpoint"]
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.certificate_authority.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }