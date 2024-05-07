terraform {
  backend "s3" {
    bucket  = "eks-netflix-argocd-ubuntu"
    key     = "argocd-netflix"
    region  = "us-east-1"
    encrypt = true
    profile = "default"
  }
}
