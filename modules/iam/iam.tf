# IAM for cluster
resource "aws_iam_role" "eks_cluster_netflix" {
  name = var.aws_iam_role_eks_cluster_netflix_name # "netflix-cluster-role"
  assume_role_policy = var.aws_iam_role_eks_cluster_assume_role_policy_netflix #  file("${path.module}/assume_role_policy.json")
}

## This null resource will update the trust policy for eks worker role.
# resource "null_resource" "add_eks_cluster_assume_role_policy" {
#   depends_on = [
#     aws_iam_openid_connect_provider.cluster
#   ]
#   provisioner "local-exec" {
#     command = "sleep 5;aws iam update-assume-role-policy --role-name ${var.aws_iam_role_eks_cluster_netflix_name} --policy-document '${self.triggers.after}' "
#   }
#   triggers = {
#     # updated_policy_json = (replace(replace(var.aws_iam_role_eks_cluster_assume_role_policy_netflix,"\n", "")," ", ""))
#     after = var.aws_iam_role_eks_cluster_assume_role_policy_netflix_updated
#   }
# }


# Associate IAM Policy to IAM Role for cluster
resource "aws_iam_role_policy_attachment" "eks_AmazonEKSClusterPolicy" {
  policy_arn = var.aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy # "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_netflix.name
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEKSVPCResourceController" {
  policy_arn = var.aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController # "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_netflix.name
}

# IAM for node group

resource "aws_iam_role" "eks_nodegroup_role_netflix" {
  name = var.aws_iam_role_eks_nodegroup_role_netflix_name
  
  assume_role_policy = jsonencode(var.aws_iam_role_eks_nodegroup_role_netflix_assume_role_policy)
#   assume_role_policy = jsonencode({
#     Statement = [
      
#     {
#       Action = "sts:AssumeRole"
#       Effect = "Allow"
#       Principal = {
#         Service = ["ec2.amazonaws.com", "eks.amazonaws.com"]
#       }
#     }
#     ]
# })
}

# resource "aws_iam_role_policy" "eks_nodegroup_role_netflix_policy" {
#   name   = "eks-nodegroup-role-netflix-describe"
#   role   = aws_iam_role.eks_nodegroup_role_netflix.name

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = [
#           "eks:DescribeCluster",
#           "eks:AccessKubernetesApi",
#           "iam:CreateOpenIDConnectProvider",
#           "sts:AssumeRoleWithWebIdentity"
#         ],
#         Effect   = "Allow",
#         Resource = "*"  # You can specify the ARN of your EKS cluster if needed.
#       }
#     ]
#   })
# }

resource "aws_iam_policy_attachment" "eks_worker_node_policy" {
  name        = var.aws_iam_policy_attachment_eks_worker_node_policy_name # "eks-worker-node-policy-attachment"  # Unique name
  policy_arn  = var.aws_iam_policy_attachment_eks_worker_node_policy_policy_arn # "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  roles       = [aws_iam_role.eks_nodegroup_role_netflix.id]
}


resource "aws_iam_policy_attachment" "eks_cni_policy" {
  name = var.aws_iam_policy_attachment_eks_cni_policy_name # "eks_cni-policy"  
  policy_arn = var.aws_iam_policy_attachment_eks_cni_policy_policy_arn # "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy" 
  roles       = [aws_iam_role.eks_nodegroup_role_netflix.id]
}

resource "aws_iam_policy_attachment" "eks_ec2_container_registry_readonly" {
  name = var.aws_iam_policy_attachment_eks_ec2_container_registry_readonly_name # "eks_worker_nodes_policy"  
  policy_arn = var.aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn # "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  roles       = [aws_iam_role.eks_nodegroup_role_netflix.id]
}

# open connection identity provider
resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"] # ["sts.amazonaws.com"]
  thumbprint_list =  [data.tls_certificate.cluster.certificates.0.sha1_fingerprint]
  url = var.eks_netflix_url # aws_eks_cluster.cluster.identity.0.oidc.0.issuer
}