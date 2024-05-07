provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "kubernetes" {
  host                   = module.eks.eks_cluster_netflix.endpoint
  cluster_ca_certificate = base64decode(module.eks.eks_cluster_netflix.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}