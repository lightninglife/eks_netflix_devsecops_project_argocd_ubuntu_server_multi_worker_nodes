module "eks_alb" {
  source = ".././modules/eks_deletion"

  null_resource_patch_ingress_remote_exec_inline     = var.null_resource_patch_ingress_remote_exec_inline
  null_resource_patch_ingress_connection_type        = var.null_resource_patch_ingress_connection_type
  null_resource_patch_ingress_connection_user        = var.null_resource_patch_ingress_connection_user
  null_resource_patch_ingress_connection_private_key = "${path.module}/web-ec2.pem"
}