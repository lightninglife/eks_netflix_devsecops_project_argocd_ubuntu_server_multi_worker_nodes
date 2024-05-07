# security group
variable "security_group_name" {
  description = "Name of the AWS security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the AWS security group"
  type        = string
}

variable "security_group_name_eks_cluster" {
  description = "Name of the AWS security group for eks cluster"
  type        = string
}

variable "security_group_description_eks_cluster" {
  description = "Description of the AWS security group for eks cluster"
  type        = string
}


# variable "vpc_id" {
#   description = "ID of the VPC where the security group will be created"
#   type        = string
# }

variable "port_80" {
  description = "Port for HTTP traffic (e.g., 80)"
  type        = number
}

variable "port_443" {
  description = "Port for HTTPS traffic (e.g., 443)"
  type        = number
}

variable "port_22" {
  description = "Port for SSH access (e.g., 22)"
  type        = number
}

variable "port_3000" {
  description = "Port for HTTP access for Grafana (e.g., 22)"
  type        = number
}

# variable "port_8080" {
#   description = "Port for HTTP access for Jenkins (e.g., 8080)"
#   type        = number
# }

variable "port_30007" {
  description = "Port for HTTP access for Netflix (e.g., 30007)"
  type        = number
}

# variable "port_8081" {
#   description = "Port for HTTP access for Netflix (e.g., 8081)"
#   type        = number
# }


variable "port_10250" {
  description = "Port for HTTP access for Argocd (e.g., 10250)"
  type        = number
}

variable "port_9000" {
  description = "Port for HTTP access for Netflix (e.g., 9000)"
  type        = number
}

variable "port_9090" {
  description = "Port for HTTP access for Prometheus (e.g., 9090)"
  type        = number
}

variable "port_9100" {
  description = "Port for HTTP access for Node Exporter (e.g., 9100)"
  type        = number
}

variable "port_9443" {
  description = "Port for HTTP access for Argocd Manifest (e.g., 9443)"
  type        = number
}

variable "port_3306" {
  description = "Port for MySQL access for RDS (e.g., 3306)"
  type        = number
}

variable "security_group_protocol" {
  description = "Protocol for the security group rules (e.g., 'tcp', 'udp', 'icmp', etc.)"
  type        = string
}

variable "web_cidr" {
  description = "CIDR block for incoming HTTP and HTTPS traffic"
  type        = string
}

variable "private_ip_address" {
  description = "CIDR block for private IP addresses (e.g., for SSH, Jenkins, MySQL)"
  type        = string
}

variable "private_subnet" {
  description = "10.0.0.0/16 private subnet"
  type        = string
}

# VPC variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

# Subnet variables
variable "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# variable "subnet" {
#   description = "Name of the subnet"
#   type        = string
# }

# Internet Gateway variables
variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
}

variable "rt_name" {
  description = "Name for the Route Table"
  type        = string
}

# Route Table Association variables
variable "rt_association" {
  description = "Name prefix for Route Table Association"
  type        = string
}

variable "availability_zones" {
  type = list(string)
}

variable "aws_subnet_public_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "aws_subnet_public_eks_alb" {
  description = "Name of the public subnet associated with the EKS Application Load Balancer (ALB)"
  type        = string
}

variable "aws_subnet_public_eks_alb_value" {
  description = "Value of the public subnet associated with the EKS ALB"
  type        = number
}

variable "aws_subnet_private_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "aws_subnet_private_eks_alb" {
  description = "Name of the private subnet associated with the EKS Application Load Balancer (ALB)"
  type        = string
}

variable "aws_subnet_private_eks_alb_value" {
  description = "Value of the private subnet associated with the EKS ALB"
  type        = number
}


# eks

variable "aws_eks_cluster_netflix_version" {
  description = "The version of netflix to use with AWS EKS cluster"
  type        = string
  # You can set your desired default value here
}

variable "eks_cluster_netflix_name" {
  description = "Name of the netflix EKS cluster"
  type        = string
}

variable "aws_eks_node_group_netflix_name" {
  description = "Name of the netflix EKS node group"
  type        = string
}

variable "aws_eks_node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = string
}

variable "aws_eks_node_group_desired_capacity" {
  description = "Desired capacity for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_min_size" {
  description = "Minimum size for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_max_size" {
  description = "Maximum size for the EKS node group"
  type        = number
}

variable "aws_eks_node_group_launch_template_name_prefix" {
  description = "Name prefix for the EKS node group launch template"
  type        = string
}

variable "aws_eks_node_group_launch_template_version" {
  description = "Version for the EKS node group launch template"
  type        = string
}

variable "aws_eks_node_group_device_name" {
  description = "Device name for the EKS node group block device mappings"
  type        = string
}

variable "aws_eks_node_group_volume_size" {
  description = "Volume size for the EKS node group block device mappings"
  type        = number
}

# variable "aws_eks_addon_netflix_addon_name" {
#   description = "Name of the AWS EKS addon for netflix"
#   type        = string
# }

# variable "aws_eks_addon_netflix_addon_version" {
#   description = "Version of the AWS EKS addon for netflix"
#   type        = string
# }

variable "addons" {
  description = "Version of the AWS EKS addon for netflix"
  type        = any
}

# variable "kubernetes_manifest_netflix_manifest" {
#   type    = map(string)
#   description = "List of paths to Kubernetes manifest files for the retail store sample app"
# }

# variable "apply_kubernetes_manifest_netflix_command" {
#   type        = string
#   description = "Command for applying the Kubernetes manifest for the retail store sample app"
# }

# variable "wait_for_deployments_netflix_command" {
#   type        = string
#   description = "Command for waiting for deployments to be available for the retail store sample app"
# }

variable "aws_eks_cluster_netflix_enabled_cluster_log_types" {
  description = "The log types of Netflix EKS cluster"
  type        = list(string)
}

variable "aws_instance_eks_cluster_netflix_bastion_host_file_type" {
  description = "The file type of the Netflix bastion host file"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_file_user" {
  description = "The user for accessing the Netflix bastion host file"
  type        = string
}

# variable "node_group_tags" {
#   type = list(map(string))
#   description = "Node group woker nodes tags"
# }

# asg
variable "key_pair_name" {
  description = "Name of the AWS Key Pair to associate with EC2 instances"
  type        = string
  # Set a default value if needed
}

variable "aws_launch_template_netflix_name_prefix" {
  description = "Name prefix for the AWS launch template"
  type        = string
}

variable "aws_launch_template_netflix_image_id" {
  description = "AMI ID for the AWS launch template"
  type        = string
}

variable "aws_launch_template_netflix_instance_type" {
  description = "Instance type for the AWS launch template"
  type        = string
}

variable "aws_launch_template_netflix_block_device_mappings_device_name" {
  description = "Device name for block device mappings in the AWS launch template"
  type        = string
}

variable "aws_launch_template_netflix_block_device_mappings_volume_size" {
  description = "Volume size for block device mappings in the AWS launch template"
  type        = number
}

variable "aws_launch_template_netflix_create_before_destroy" {
  description = "Lifecycle setting for create_before_destroy in the AWS launch template"
  type        = bool
}

variable "aws_autoscaling_group_netflix_desired_capacity" {
  description = "Desired capacity for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_netflix_max_size" {
  description = "Maximum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_netflix_min_size" {
  description = "Minimum size for the AWS Auto Scaling Group"
  type        = number
}

variable "aws_autoscaling_group_netflix_launch_template_version" {
  description = "Launch template version for the AWS Auto Scaling Group"
  type        = string
}

variable "aws_autoscaling_group_netflix_tag_key" {
  description = "Tag key for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_netflix_tag_value" {
  description = "Tag value for the AWS Auto Scaling Group instances"
  type        = string
}

variable "aws_autoscaling_group_netflix_tag_propagate_at_launch" {
  description = "Tag propagation setting for the AWS Auto Scaling Group instances"
  type        = bool
}

variable "aws_launch_template_netflix_user_data" {
  description = "Userdata file"
  type        = string
}

# iam
variable "aws_iam_role_eks_cluster_netflix_name" {
  description = "Iam role name for esk cluster netflix"
  type        = string
}

# variable "aws_iam_role_eks_cluster_assume_role_policy_netflix_updated" {
#   description = "Name of the IAM role associated with EKS nodegroups for netflix"
#   type        = string
#   # You can set a default value if needed
#   # default     = "example-role-name"
# }

variable "aws_iam_role_eks_nodegroup_role_netflix_name" {
  type        = string
  description = "IAM role policy for assuming roles in the EKS cluster for Netflix (updated)"
}

variable "data_http_lbc_iam_policy_url" {
  description = "The URL for the IAM policy document for the data HTTP load balancer controller"
  type        = string
}

variable "data_http_lbc_iam_policy_request_headers_accept" {
  description = "The value for the 'Accept' header in the IAM policy document for the data HTTP load balancer controller"
  type        = string
}

variable "aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy" {
  description = "ARN of the IAM policy attached to an EKS cluster role allowing control plane to make API requests on your behalf"
  type        = string
}

variable "aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController" {
  description = "ARN of the IAM policy attached to an EKS cluster role allowing the VPC resource controller to make API requests on your behalf"
  type        = string
}

variable "aws_iam_role_eks_nodegroup_role_netflix_assume_role_policy" {
  description = "The assume role policy document for the Netflix EKS node group role"
  type        = any
}

variable "aws_iam_policy_attachment_eks_worker_node_policy_name" {
  description = "The name of the IAM policy attachment for the EKS worker node policy"
  type        = string
}

variable "aws_iam_policy_attachment_eks_worker_node_policy_policy_arn" {
  description = "The ARN of the IAM policy attached to EKS worker nodes"
  type        = string
}

variable "aws_iam_policy_attachment_eks_cni_policy_name" {
  description = "The name of the IAM policy attachment for the EKS CNI policy"
  type        = string
}

variable "aws_iam_policy_attachment_eks_cni_policy_policy_arn" {
  description = "The ARN of the IAM policy attached to EKS CNI"
  type        = string
}

variable "aws_iam_policy_attachment_eks_ec2_container_registry_readonly_name" {
  description = "The name of the IAM policy attachment for EC2 Container Registry readonly access"
  type        = string
}

variable "aws_iam_policy_attachment_eks_ec2_container_registry_readonly_policy_arn" {
  description = "The ARN of the IAM policy attached to EC2 Container Registry for readonly access"
  type        = string
}


# bastion
variable "aws_instance_eks_cluster_netflix_bastion_host_ami" {
  description = "The AMI ID for the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_instance_type" {
  description = "The instance type for the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_tags" {
  description = "Tags for the bastion host instance"
  type        = string
}

# variable "aws_instance_eks_cluster_netflix_bastion_host_provisioner_source" {
#   description = "Source path of the file to be provisioned to the bastion host"
#   type        = string
# }

variable "aws_instance_eks_cluster_netflix_bastion_host_provisioner_destination" {
  description = "Destination path on the bastion host where the file will be copied"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_remote_exec_inline" {
  description = "Inline script to be executed on the bastion host using remote-exec provisioner"
  type        = list(string)
}