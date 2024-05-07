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