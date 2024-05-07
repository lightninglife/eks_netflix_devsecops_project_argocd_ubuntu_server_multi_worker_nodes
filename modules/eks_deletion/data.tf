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

data "aws_instances" "eks_netflix" { 
  filter {
    name   = "tag:eks:cluster-name"
    values = ["eks-netflix-cluster"]
  }

  instance_state_names = ["running"]

}

data "aws_instance" "bastion" { 
  filter {
    name   = "tag:Name"
    values = ["bastion-host"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

# data "aws_lb" "argocd" {
#   name = "argocd"
# }



data "aws_security_groups" "filtered" {
  tags = {
    "elbv2.k8s.aws/cluster"    = "eks-netflix-cluster"
    "ingress.k8s.aws/stack"     = "argocd/argocd-ingress"
    "ingress.k8s.aws/resource"  = "ManagedLBSecurityGroup"
  }
}

data "aws_security_groups" "filtered_shared" {
  tags = {
    "elbv2.k8s.aws/resource" = "backend-sg"
    "elbv2.k8s.aws/cluster"  = "eks-netflix-cluster"
  }
}

data "aws_security_groups" "all" {
  filter {
    name   = "group-name"
    values = ["*all*"]
  }
}