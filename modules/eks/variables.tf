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

variable "subnets" {
  description = "subnets"
  type        = list(string)
}

variable "aws_eks_cluster_netflix_role_arn" {
  description = "EKS Cluster for netflix's role arn"
  type        = string
}

variable "aws_eks_node_group_netflix_role_arn" {
  description = "EKS node group for netflix's role arn"
  type        = string
}

variable "aws_eks_cluster_netflix_version" {
  description = "The version of netflix to use with AWS EKS cluster"
  type        = string
   # You can set your desired default value here
}

variable "ec2_ssh_key" {
  description = "Name of the EC2 SSH key pair"
  type        = string
  # You can set a default value if needed
  # default     = "example-key-pair-name"
}

variable "eks_worker_node_policy_attachment_netflix" {
  description = "IAM policy attachment name for worker nodes in netflix EKS setup"
  type        = string
}

variable "eks_cni_policy_attachment_netflix" {
  description = "IAM policy attachment name for CNI (Container Network Interface) in netflix EKS setup"
  type        = string
}

variable "eks_ec2_container_registry_readonly_attachment_netflix" {
  description = "IAM policy attachment name for read-only access to the EC2 container registry in netflix EKS setup"
  type        = string
}

variable "aws_eks_node_group_launch_template_name_prefix_netflix" {
  description = "Prefix for the name of the AWS EKS Node Group launch template in netflix setup"
  type        = string
  # You can provide a default prefix if needed
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


variable "aws_eks_cluster_netflix_security_group_ids" {
  description = "Security group IDs for the EKS cluster used by netflix"
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

variable "key_pair_name" {
  description = "The name of the AWS key pair used to access the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_subnet_id" {
  description = "The ID of the subnet where the bastion host will be launched"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_security_groups" {
  description = "The ID of the security group(s) for the bastion host"
  type        = list(string)
}

variable "aws_instance_eks_cluster_netflix_bastion_host_tags" {
  description = "Tags for the bastion host instance"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_provisioner_source" {
  description = "Source path of the file to be provisioned to the bastion host"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_provisioner_destination" {
  description = "Destination path on the bastion host where the file will be copied"
  type        = string
}

variable "aws_instance_eks_cluster_netflix_bastion_host_remote_exec_inline" {
  description = "Inline script to be executed on the bastion host using remote-exec provisioner"
  type        = list(string)
}

# variable "kubernetes_manifest_netflix_manifest" {
#   type    = string
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

variable "aws_iam_role_policy_attachment_eks_AmazonEKSClusterPolicy" {
  description = "ARN of the IAM policy attached to EKS cluster for AmazonEKSClusterPolicy"
  type        = any
}

variable "aws_iam_role_policy_attachment_eks_AmazonEKSVPCResourceController" {
  description = "ARN of the IAM policy attached to EKS cluster for AmazonEKSVPCResourceController"
  type        = any
}

# variable "kubernetes_manifest_argo_cd" {
#   description = "Path to the Argo CD manifest file"
#   type        = any
# }

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