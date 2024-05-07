terraform {
  backend "s3" {
    bucket  = "eks-netflix-argocd-ubuntu"
    key     = "eks-cluster"
    region  = "us-east-1"
    encrypt = true
    profile = "default"
  }
}
