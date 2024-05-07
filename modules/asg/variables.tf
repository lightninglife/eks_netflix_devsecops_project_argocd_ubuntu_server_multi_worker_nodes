# netflix

variable "aws_launch_template_netflix_vpc_security_group_ids" {
  description = "List of security group IDs for the AWS Launch Template used in netflix EKS setup"
  type        = list(string)
  # You can provide a default value if needed:
  # default     = ["sg-xxxxxxxxxxxxxxx", "sg-yyyyyyyyyyyyyyy"]
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

variable "aws_autoscaling_group_netflix_vpc_zone_identifier" {
  description = "subnet id"
  type        = list(string)
}

variable "aws_launch_template_netflix_network_interfaces_security_groups" {
  description = "List of security group IDs to associate with network interfaces in the launch template"
  type        = list(string)
# You can set default security groups here if needed
}

variable "eks_cluster_netflix_name" {
  description = "Name of the netflix EKS cluster"
  type        = string
}

variable "aws_eks_node_group_instance_types" {
  description = "Instance types for the EKS node group"
  type        = string
}

# variable "kubernetes_network_policy_jenkins_network_policy_spec_ingress_app" {
#   description = "The label selector for matching pods in the ingress rule."
#   type        = string
# }

variable "aws_eks_cluster_netflix_version" {
  description = "The version of netflix to use with AWS EKS cluster"
  type        = string
  # You can set your desired default value here
}

variable "key_pair_name" {
  description = "Name of the AWS Key Pair to associate with EC2 instances"
  type        = string
  # Set a default value if needed
}
