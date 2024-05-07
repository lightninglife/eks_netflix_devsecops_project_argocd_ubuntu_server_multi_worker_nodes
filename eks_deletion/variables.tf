variable "null_resource_patch_ingress_remote_exec_inline" {
  description = "Inline command to execute remotely using remote-exec provisioner"
  type        = string
}

variable "null_resource_patch_ingress_connection_type" {
  description = "Type of connection for the remote-exec provisioner"
  type        = string
}

variable "null_resource_patch_ingress_connection_user" {
  description = "Username for SSH connection used in the remote-exec provisioner"
  type        = string
}