# esk netflix
resource "aws_eks_cluster" "netflix" {
  name     = var.eks_cluster_netflix_name # "netflix-cluster"
  role_arn = var.aws_eks_cluster_netflix_role_arn

  vpc_config {
    subnet_ids = var.subnets # Replace with your subnet IDs
    security_group_ids = [var.aws_eks_cluster_netflix_security_group_ids]
  }

  version = var.aws_eks_cluster_netflix_version
  
  enabled_cluster_log_types = var.aws_eks_cluster_netflix_enabled_cluster_log_types # ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    var.aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy, # aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    var.aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController # aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
  ]

}

resource "aws_eks_node_group" "netflix" {
  cluster_name    = aws_eks_cluster.netflix.name
  node_group_name = var.aws_eks_node_group_netflix_name # "netflix-node-group"
  node_role_arn   = var.aws_eks_node_group_netflix_role_arn
  subnet_ids      = var.subnets # Replace with your subnet IDs
  # instance_types  = [var.aws_eks_node_group_instance_types] # ["t2.micro"]
  scaling_config {
    desired_size = var.aws_eks_node_group_desired_capacity # 2
    min_size        = var.aws_eks_node_group_min_size # 1
    max_size        = var.aws_eks_node_group_max_size # 3
  }
  
  tags = {
    for i in range(var.aws_eks_node_group_desired_capacity - 1) :   # Generate dynamic tag keys based on desired_size
    "worker_node${i}" => i
  }

  launch_template {
    id = var.aws_eks_node_group_launch_template_name_prefix_netflix # "id"
    version     = var.aws_eks_node_group_launch_template_version # "$Latest"

  }

  depends_on = [
    var.eks_worker_node_policy_attachment_netflix,
    var.eks_cni_policy_attachment_netflix,
    var.eks_ec2_container_registry_readonly_attachment_netflix
  ]
}

# resource "aws_eks_addon" "netflix" {
#   cluster_name                = aws_eks_cluster.netflix.name
#   addon_name                  = var.aws_eks_addon_netflix_addon_name # "vpc-cni"
#   addon_version               = var.aws_eks_addon_netflix_addon_version # "v1.16.2-eksbuild.1" #e.g., previous version v1.9.3-eksbuild.3 and the new version is v1.10.1-eksbuild.1
# }


resource "aws_eks_addon" "netflix_addon" {
  for_each = var.addons

  cluster_name  = aws_eks_cluster.netflix.name
  addon_name    = each.value.addon_name
  addon_version = each.value.addon_version
}