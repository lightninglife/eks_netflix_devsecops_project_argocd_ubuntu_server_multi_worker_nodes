# data "template_file" "ansible_userdata" {
#   template = file("ansible_userdata.tpl")

#   vars = {
#     aws_access_key_id                                                 = aws_access_key_id
#     aws_secret_access_key                                             = aws_secret_access_key
#     aws_region                                                        = aws_region
#     eks_cluster_ansible_name                                          = eks_cluster_ansible_name
#     aws_eks_node_group_instance_types                                 = aws_eks_node_group_instance_types
#     aws_eks_cluster_ansible_version = aws_eks_cluster_ansible_version
#   }
# 
data "terraform_remote_state" "s3" {
  backend = "s3" # Set your backend configuration here
  config = {
    bucket = "eks-netflix-argocd-ubuntu"
    key    = "eks-cluster"
    region = "us-east-1"
  }
}


# Datasource: EKS Cluster Auth 
data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.s3.outputs.eks_cluster_netflix_name
}

data "aws_iam_openid_connect_provider" "eks_cluster_netflix" {
  arn = data.terraform_remote_state.s3.outputs.oidc_provider_arn
}

data "external" "api_server_endpoint" {
  program = ["bash", "${path.module}/api_server_endpoint.sh"]
}

data "aws_eks_cluster" "certificate_authority" {
  name = data.terraform_remote_state.s3.outputs.eks_cluster_netflix_name
}


# vpc

data "aws_vpc" "vpc" {
  id = data.terraform_remote_state.s3.outputs.vpc_id
}

# eks asg
data "aws_autoscaling_group" "eks" {
  name = data.terraform_remote_state.s3.outputs.eks_asg_name

}

# # esk worker node
# data "aws_instance" "eks" {
#   instance_id = data.terraform_remote_state.s3.outputs.eks_asg_instance_ids
# }

# security group
data "aws_security_group" "all" {
  id = data.terraform_remote_state.s3.outputs.sg_id
}

# subnet ids
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.s3.outputs.vpc_id]
  }

  tags = {
    Name = "public_subnets"
  }

}

data "aws_instances" "eks_worker_node" {

  filter {
    name   = "tag:aws:eks:cluster-name"
    values = ["eks-netflix-cluster"]
  }
}


# data "aws_lb" "eks" {
#   name = "eks-netflix"

#   depends_on = [module.eks_alb.aws_lb]
# }

data "aws_caller_identity" "current" {}


locals {
  arn_prefix  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/"
  aud_sub_key = replace(data.aws_iam_openid_connect_provider.eks_cluster_netflix.arn, local.arn_prefix, "")
}