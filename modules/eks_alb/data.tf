# Datasource: AWS Load Balancer Controller IAM Policy get from aws-load-balancer-controller/ GIT Repo (latest)
data "http" "lbc_iam_policy" {
  url = var.data_http_lbc_iam_policy_url # "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"

  # Optional request headers
  request_headers = {
    Accept = var.data_http_lbc_iam_policy_request_headers_accept # "application/json"
  }
}

data "aws_lb" "eks" {
  depends_on = [aws_lb.eks]
  name       = aws_lb.eks.name
}

# data "aws_lb" "argocd" {
#   depends_on = [kubernetes_ingress_v1.argocd_ingress]
#   name       = var.kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name_value
# }

# data "aws_lb" "argocd" {
#   name       = "argocd"
# }

# data "aws_lb_target_group" "argocd" {
#   tags = {
#     "ingress.k8s.aws/resource" = "argocd/argocd-server-argocd-server:80"
#     "ingress.k8s.aws/stack" = "argocd/argocd-server"
#   }
#   depends_on = [kubernetes_ingress_v1.argocd_ingress]
# }

# data "aws_autoscaling_groups" "eks" {
#   filter {
#     name   = "tag:eks:cluster-name"
#     values = ["eks-netflix-cluster"]
#   }
# }

# data "aws_security_groups" "filtered" {
#   tags = {
#     "elbv2.k8s.aws/cluster"    = "eks-netflix-cluster"
#     "ingress.k8s.aws/stack"     = "argocd/argocd-server"
#     "ingress.k8s.aws/resource"  = "ManagedLBSecurityGroup"
#   }
# }

# data "aws_security_groups" "filtered_shared" {
#   tags = {
#     "elbv2.k8s.aws/resource" = "backend-sg"
#     "elbv2.k8s.aws/cluster"  = "eks-netflix-cluster"
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


data "aws_security_groups" "all" {
  filter {
    name   = "group-name"
    values = ["*all*"]
  }
}

data "aws_s3_object" "argocd_port" {
  bucket = "eks-netflix-argocd-ubuntu"
  key    = "argocd_port_0.txt"

  depends_on = [null_resource.output_argocd_port]
}