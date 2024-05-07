data "aws_caller_identity" "current" {

}

data "aws_iam_openid_connect_provider" "eks_cluster_netflix" {
  arn = module.iam.oidc_provider_arn
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.eks_cluster_netflix_name
}

# data "aws_secretsmanager_secret" "aws_credentials" {
#   arn = "arn:aws:secretsmanager:us-east-1:951507339182:secret:aws_keys-sWkcIb"
# }

