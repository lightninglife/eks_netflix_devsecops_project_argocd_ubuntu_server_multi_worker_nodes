variable "null_resource_argocd_ready_remote_exec_inline" {
  type    = string
}

variable "null_resource_wait_for_argocd_connection_type" {
  type    = string
}

variable "null_resource_wait_for_argocd_connection_user" {
  type    = string
}

variable "null_resource_wait_for_argocd_connection_private_key" {
  type    = string
}

variable "argocd_application_netflix_metadata_name" {
  type    = string
}

variable "argocd_application_netflix_metadata_namespace" {
  type    = string
}

variable "argocd_application_netflix_spec_project_name" {
  type    = string
}

variable "argocd_application_netflix_spec_source" {
  type    = any
}

variable "argocd_application_netflix_spec_source_directory" {
  type    = any
}

variable "argocd_application_netflix_spec_destination" {
  type    = any
}

variable "argocd_application_netflix_spec_sync_policy" {
  type    = any
}

# variable "null_resource_get_argocd_admin_password_remote_exec_inline" {
#   type    = string
# }

variable "argocd_application_netflix_spec_sync_policy_automated" {
  type    = any
}

variable "aws_security_group_rule_8080_type" {
  description = "The type of rule (ingress or egress)"
  type        = string
}

variable "aws_security_group_rule_8080_from_port" {
  description = "The starting port range for the rule"
  type        = number
}

variable "aws_security_group_rule_8080_to_port" {
  description = "The ending port range for the rule"
  type        = number
}

variable "aws_security_group_rule_8080_protocol" {
  description = "The protocol to which this rule applies (tcp, udp, icmp, etc.)"
  type        = string
}

variable "aws_security_group_rule_8080_cidr_blocks" {
  description = "List of CIDR blocks to allow traffic from/to"
  type        = list(string)
}
