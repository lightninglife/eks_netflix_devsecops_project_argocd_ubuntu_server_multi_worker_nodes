provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.external.api_server_endpoint.result["api_endpoint"]
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.certificate_authority.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

# Terraform Kubernetes Provider
provider "kubernetes" {
  host                   = data.external.api_server_endpoint.result["api_endpoint"]
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.certificate_authority.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}