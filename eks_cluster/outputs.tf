output "security_group_name" {
  value = var.security_group_name
}

output "security_group_description" {
  value = var.security_group_description
}

output "security_group_name_eks_cluster" {
  value = var.security_group_name_eks_cluster
}

output "security_group_description_eks_cluster" {
  value = var.security_group_description_eks_cluster
}

output "private_ip_address" {
  value = var.private_ip_address
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = var.vpc_name
}

output "public_subnet_cidr_blocks" {
  value = var.public_subnet_cidr_blocks
}

output "private_subnet_cidr_blocks" {
  value = var.private_subnet_cidr_blocks
}

output "availability_zones" {
  value = var.availability_zones
}

output "igw_name" {
  value = var.igw_name
}

output "rt_name" {
  value = var.rt_name
}

output "rt_association" {
  value = var.rt_association
}

output "eks_cluster_netflix_name" {
  value = var.eks_cluster_netflix_name
}

output "aws_eks_node_group_netflix_name" {
  value = var.aws_eks_node_group_netflix_name
}

output "aws_eks_node_group_instance_types" {
  value = var.aws_eks_node_group_instance_types
}

output "aws_eks_node_group_desired_capacity" {
  value = var.aws_eks_node_group_desired_capacity
}

output "aws_eks_node_group_min_size" {
  value = var.aws_eks_node_group_min_size
}

output "aws_eks_node_group_max_size" {
  value = var.aws_eks_node_group_max_size
}

output "aws_eks_node_group_launch_template_name_prefix" {
  value = var.aws_eks_node_group_launch_template_name_prefix
}

output "aws_eks_node_group_launch_template_version" {
  value = var.aws_eks_node_group_launch_template_version
}

output "aws_eks_node_group_device_name" {
  value = var.aws_eks_node_group_device_name
}

output "aws_eks_node_group_volume_size" {
  value = var.aws_eks_node_group_volume_size
}

output "aws_eks_cluster_netflix_version" {
  value = var.aws_eks_cluster_netflix_version
}

# output "aws_eks_addon_netflix_addon_name" {
#   value = var.aws_eks_addon_netflix_addon_name
# }

# output "aws_eks_addon_netflix_addon_version" {
#   value = var.aws_eks_addon_netflix_addon_version
# }

output "aws_eks_addon_netflix" {
  value = var.addons
}


output "key_pair_name" {
  value = var.key_pair_name
}

output "aws_launch_template_netflix_name_prefix" {
  value = var.aws_launch_template_netflix_name_prefix
}

output "aws_launch_template_netflix_image_id" {
  value = var.aws_launch_template_netflix_image_id
}

output "aws_launch_template_netflix_instance_type" {
  value = var.aws_launch_template_netflix_instance_type
}

output "eks_asg_name" {
  value = module.eks.eks_asg_name
}

output "sg_id" {
  value = module.sg.security_group_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "oidc_provider_arn" {
  value = module.iam.oidc_provider_arn
}

