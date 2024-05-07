# data "terraform_remote_state" "s3" {
#   backend = "s3" # Set your backend configuration here
#   config = {
#     bucket = "eks-netflix-argocd"
#     key    = "eks-alb"
#     region = "us-east-1"
#   }
# }


# data "external" "ssh_command" {
#   program = ["bash", "${path.module}/output_secrets.sh"]
#   # program = ["ssh", "-i", "web-ec2.pem", "ec2-user@\"${data.aws_instance.bastion.public_ip}", "cat", "/tmp/secrets.txt"]
#   query = {
#     WORKER_NODE_IP = "${data.aws_instance.eks_netflix.private_ip}"
#     BASTION_HOST   = "${data.aws_instance.bastion.public_ip}"
#   }
# }

data "aws_s3_object" "argocd_netfilx" {
  bucket = "eks-netflix-argocd"
  key    = "secrets_0.txt"
}

# data "aws_instance" "bastion" {
#   filter {
#     name   = "tag:Name"
#     values = ["bastion-host"]
#   }

#   filter {
#     name   = "instance-state-name"
#     values = ["running"]
#   }
# }

# data "aws_instance" "eks_netflix" {
#   filter {
#     name   = "tag:eks:cluster-name"
#     values = ["eks-netflix-cluster"]
#   }

#   filter {
#     name   = "instance-state-name"
#     values = ["running"]
#   }


# }

data "aws_lb" "argocd" {
  name = "argocd"
}

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

# data "external" "api_server_endpoint" {
#   program = ["bash", "${path.module}/api_server_endpoint.sh"]
# }

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