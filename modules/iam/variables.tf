#iam
variable "aws_iam_role_eks_cluster_netflix_name" {
  description = "Iam role name for esk cluster"
  type        = string
}

variable "aws_iam_role_eks_cluster_assume_role_policy_netflix" {
  description = "file of the policy netflix"
  type        = string
}

variable "aws_iam_role_eks_nodegroup_role_netflix_name" {
  description = "Name of the IAM role associated with EKS nodegroups for netflix"
  type        = string
  # You can set a default value if needed
  # default     = "example-role-name"
}

variable "eks_netflix_url" {
  type    = string
}

variable "tags" {
  type    = map(string)
  default = {
    Environment = "production"
    ServiceType = "backend"
    // Additional tags...
  }
}

variable "aws_iam_role_eks_cluster_assume_role_policy_netflix_updated" {
  type        = string
  description = "IAM role policy for assuming roles in the EKS cluster for Netflix (updated)"
}

variable "eks_cluster_netflix" {
  description = "Netflix EKS cluster"
  type        = any
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
