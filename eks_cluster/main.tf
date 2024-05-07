module "asg" {
  source = ".././modules/asg" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  key_pair_name                                                  = var.key_pair_name
  aws_launch_template_netflix_vpc_security_group_ids             = module.sg.security_group_ids
  aws_launch_template_netflix_name_prefix                        = var.aws_launch_template_netflix_name_prefix
  aws_launch_template_netflix_image_id                           = var.aws_launch_template_netflix_image_id
  aws_launch_template_netflix_instance_type                      = var.aws_launch_template_netflix_instance_type
  aws_launch_template_netflix_block_device_mappings_device_name  = var.aws_launch_template_netflix_block_device_mappings_device_name
  aws_launch_template_netflix_block_device_mappings_volume_size  = var.aws_launch_template_netflix_block_device_mappings_volume_size
  aws_launch_template_netflix_create_before_destroy              = var.aws_launch_template_netflix_create_before_destroy
  aws_autoscaling_group_netflix_desired_capacity                 = var.aws_autoscaling_group_netflix_desired_capacity
  aws_autoscaling_group_netflix_max_size                         = var.aws_autoscaling_group_netflix_max_size
  aws_autoscaling_group_netflix_min_size                         = var.aws_autoscaling_group_netflix_min_size
  aws_autoscaling_group_netflix_launch_template_version          = var.aws_autoscaling_group_netflix_launch_template_version
  aws_autoscaling_group_netflix_tag_key                          = var.aws_autoscaling_group_netflix_tag_key
  aws_autoscaling_group_netflix_tag_value                        = var.aws_autoscaling_group_netflix_tag_value
  aws_autoscaling_group_netflix_tag_propagate_at_launch          = var.aws_autoscaling_group_netflix_tag_propagate_at_launch
  aws_launch_template_netflix_user_data                          = var.aws_launch_template_netflix_user_data
  aws_autoscaling_group_netflix_vpc_zone_identifier              = module.vpc.subnet_ids
  aws_launch_template_netflix_network_interfaces_security_groups = module.sg.security_group_ids
  eks_cluster_netflix_name                                       = var.eks_cluster_netflix_name
  aws_eks_node_group_instance_types                              = var.aws_eks_node_group_instance_types
  # kubernetes_network_policy_jenkins_network_policy_spec_ingress_app = var.kubernetes_network_policy_jenkins_network_policy_spec_ingress_app
  aws_eks_cluster_netflix_version = var.aws_eks_cluster_netflix_version
}

module "eks" {
  source = ".././modules/eks" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  eks_cluster_netflix_name                       = var.eks_cluster_netflix_name
  aws_eks_node_group_netflix_name                = var.aws_eks_node_group_netflix_name
  aws_eks_node_group_instance_types              = var.aws_eks_node_group_instance_types
  aws_eks_node_group_desired_capacity            = var.aws_eks_node_group_desired_capacity
  aws_eks_node_group_min_size                    = var.aws_eks_node_group_min_size
  aws_eks_node_group_max_size                    = var.aws_eks_node_group_max_size
  aws_eks_node_group_launch_template_name_prefix = module.asg.launch_template_id_netflix
  aws_eks_node_group_launch_template_version     = var.aws_eks_node_group_launch_template_version
  aws_eks_node_group_device_name                 = var.aws_eks_node_group_device_name
  aws_eks_node_group_volume_size                 = var.aws_eks_node_group_volume_size
  subnets                                        = module.vpc.subnet_ids
  # kubernetes_network_policy_jenkins_network_policy_policy_types                                     = var.kubernetes_network_policy_jenkins_network_policy_policy_types
  # kubernetes_service_jenkins_master_service_load_balancer_ip                                        = module.alb.jenkins_alb_dns_name
  aws_eks_cluster_netflix_role_arn = module.iam.eks_netflix_cluster_iam_role_arn
  # kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type                 = var.kubernetes_horizontal_pod_autoscaler_jenkins_hpa_spec_metric_resource_target_type
  aws_eks_node_group_netflix_role_arn                    = module.iam.eks_netflix_nodegroup_iam_role_arn
  ec2_ssh_key                                            = "${path.module}/web-ec2.pem"
  eks_worker_node_policy_attachment_netflix              = module.iam.eks_worker_node_policy_attachment_netflix
  eks_cni_policy_attachment_netflix                      = module.iam.eks_cni_policy_attachment_netflix
  eks_ec2_container_registry_readonly_attachment_netflix = module.iam.eks_ec2_container_registry_readonly_attachment_netflix
  aws_eks_node_group_launch_template_name_prefix_netflix = module.asg.launch_template_id_netflix
  # aws_eks_addon_netflix_addon_name                                      = var.aws_eks_addon_netflix_addon_name
  # aws_eks_addon_netflix_addon_version                                   = var.aws_eks_addon_netflix_addon_version
  addons                                                                = var.addons
  aws_eks_cluster_netflix_security_group_ids                            = module.sg.security_group_id_eks_cluster
  aws_eks_cluster_netflix_version                                       = var.aws_eks_cluster_netflix_version
  aws_instance_eks_cluster_netflix_bastion_host_ami                     = var.aws_instance_eks_cluster_netflix_bastion_host_ami
  aws_instance_eks_cluster_netflix_bastion_host_instance_type           = var.aws_instance_eks_cluster_netflix_bastion_host_instance_type
  key_pair_name                                                         = var.key_pair_name
  aws_instance_eks_cluster_netflix_bastion_host_subnet_id               = module.vpc.public_subnet
  aws_instance_eks_cluster_netflix_bastion_host_security_groups         = module.sg.security_group_ids
  aws_instance_eks_cluster_netflix_bastion_host_tags                    = var.aws_instance_eks_cluster_netflix_bastion_host_tags
  aws_instance_eks_cluster_netflix_bastion_host_provisioner_destination = var.aws_instance_eks_cluster_netflix_bastion_host_provisioner_destination
  aws_instance_eks_cluster_netflix_bastion_host_provisioner_source      = "${path.module}/web-ec2.pem"
  aws_instance_eks_cluster_netflix_bastion_host_remote_exec_inline      = var.aws_instance_eks_cluster_netflix_bastion_host_remote_exec_inline
  # kubernetes_manifest_netflix_manifest                                  = file("${path.module}/retail-store-sample-app-deploy.yaml")
  # apply_kubernetes_manifest_netflix_command = var.apply_kubernetes_manifest_netflix_command
  # wait_for_deployments_netflix_command      = var.wait_for_deployments_netflix_command
  aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy         = module.iam.eks_AmazonEKSClusterPolicy
  aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController = module.iam.eks_AmazonEKSVPCResourceController
  aws_eks_cluster_netflix_enabled_cluster_log_types                 = var.aws_eks_cluster_netflix_enabled_cluster_log_types
  # kubernetes_manifest_argo_cd                                       = file("${path.module}/install.yaml")
  aws_instance_eks_cluster_netflix_bastion_host_file_type = var.aws_instance_eks_cluster_netflix_bastion_host_file_type
  aws_instance_eks_cluster_netflix_bastion_host_file_user = var.aws_instance_eks_cluster_netflix_bastion_host_file_user
  # node_group_tags = var.node_group_tags
}

module "iam" {
  source = ".././modules/iam" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  aws_iam_role_eks_cluster_netflix_name = var.aws_iam_role_eks_cluster_netflix_name
  # aws_iam_role_eks_cluster_assume_role_policy_netflix = templatefile("${path.module}/assume_role_policy.tpl.json", {
  #   account_id       = data.aws_caller_identity.current.account_id,
  #   oidc_provider_url = module.iam.oidc_provider_url
  # })
  aws_iam_role_eks_cluster_assume_role_policy_netflix                      = file("${path.module}/assume_role_policy.json")
  aws_iam_role_eks_nodegroup_role_netflix_name                             = var.aws_iam_role_eks_nodegroup_role_netflix_name
  eks_netflix_url                                                          = module.eks.eks_cluster_netflix_url
  eks_cluster_netflix                                                      = module.eks.eks_cluster_netflix
  aws_iam_role_eks_cluster_assume_role_policy_netflix_updated              = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "eks.amazonaws.com",
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${data.aws_iam_openid_connect_provider.eks_cluster_netflix.arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "${replace(data.aws_iam_openid_connect_provider.eks_cluster_netflix.arn, "arn:aws:iam::951507339182:oidc-provider/", "")}:sub": "system:serviceaccount:*"
        }
      }
    }
  ]
}
EOF
  data_http_lbc_iam_policy_url                                             = var.data_http_lbc_iam_policy_url
  data_http_lbc_iam_policy_request_headers_accept                          = var.data_http_lbc_iam_policy_request_headers_accept
  aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy                = var.aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy
  aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController        = var.aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController
  aws_iam_role_eks_nodegroup_role_netflix_assume_role_policy               = var.aws_iam_role_eks_nodegroup_role_netflix_assume_role_policy
  aws_iam_policy_attachment_eks_worker_node_policy_name                    = var.aws_iam_policy_attachment_eks_worker_node_policy_name
  aws_iam_policy_attachment_eks_worker_node_policy_policy_arn              = var.aws_iam_policy_attachment_eks_worker_node_policy_policy_arn
  aws_iam_policy_attachment_eks_cni_policy_name                            = var.aws_iam_policy_attachment_eks_cni_policy_name
  aws_iam_policy_attachment_eks_cni_policy_policy_arn                      = var.aws_iam_policy_attachment_eks_cni_policy_policy_arn
  aws_iam_policy_attachment_eks_ec2_container_registry_readonly_name       = var.aws_iam_policy_attachment_eks_ec2_container_registry_readonly_name
  aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn = var.aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn
}

module "sg" {
  source = ".././modules/sg" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  security_group_name                    = var.security_group_name
  security_group_description             = var.security_group_description
  security_group_name_eks_cluster        = var.security_group_name_eks_cluster
  security_group_description_eks_cluster = var.security_group_description_eks_cluster
  vpc_id                                 = module.vpc.vpc_id
  port_80                                = var.port_80
  port_443                               = var.port_443
  port_22                                = var.port_22
  port_3000                              = var.port_3000
  # port_8080                              = var.port_8080
  # port_8081                              = var.port_8081
  port_10250              = var.port_10250
  port_30007              = var.port_30007
  port_9000               = var.port_9000
  port_9090               = var.port_9090
  port_9100               = var.port_9100
  port_9443               = var.port_9443
  port_3306               = var.port_3306
  security_group_protocol = var.security_group_protocol
  web_cidr                = var.web_cidr
  private_ip_address      = var.private_ip_address
  vpc_cidr_block          = var.vpc_cidr_block
  private_subnet          = var.private_subnet
}

module "vpc" {
  source = ".././modules/vpc" # Replace with the actual path to your module directory

  # Use the same variable for multiple input arguments
  vpc_cidr_block             = var.vpc_cidr_block
  vpc_name                   = var.vpc_name
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  # subnet                     = var.subnet
  igw_name                         = var.igw_name
  web_cidr                         = var.web_cidr
  rt_name                          = var.rt_name
  rt_association                   = var.rt_association
  availability_zones               = var.availability_zones
  aws_subnet_public_name           = var.aws_subnet_public_name
  aws_subnet_public_eks_alb        = var.aws_subnet_public_eks_alb
  aws_subnet_public_eks_alb_value  = var.aws_subnet_public_eks_alb_value
  aws_subnet_private_name          = var.aws_subnet_private_name
  aws_subnet_private_eks_alb       = var.aws_subnet_private_eks_alb
  aws_subnet_private_eks_alb_value = var.aws_subnet_private_eks_alb_value
}