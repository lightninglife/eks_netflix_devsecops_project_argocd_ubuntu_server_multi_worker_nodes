# resource "null_resource" "patch_ingress" {
#   provisioner "remote-exec" {
#     inline = [
#       "ssh -i \"web-ec2.pem\" ubuntu@${data.aws_instances.eks_netflix.private_ips[0]} \"${var.null_resource_patch_ingress_remote_exec_inline}" # "kubectl patch ingress argocd-server -n argocd -p '{\"metadata\":{\"finalizers\":[]}}' --type=merge"
#     ]
#   }

#   # You can specify the connection information here.
#   connection {
#     type        = var.null_resource_patch_ingress_connection_type # "ssh"
#     user        = var.null_resource_patch_ingress_connection_user # "your_ssh_user"
#     private_key = file(var.null_resource_patch_ingress_connection_private_key)
#     host        = data.aws_instance.bastion.public_ip
#   }

# }

# data "aws_security_groups" "alg_ingresss_sg" {
#   tags = {
#     "elbv2.k8s.aws/cluster"   = "eks-netflix-cluster"  # Specify the tag key and value you want to filter by
#   }
# }

# data "aws_instance" "eks_cluster" {
#    filter {
#     name   = "tag:Name"
#     values = ["eks-cluster-netflix"]
#   }
# }

# resource "aws_security_group" "alg_ingresss_sg" {
#   for_each = toset(data.aws_security_groups.alg_ingresss_sg.ids)

#   # No need to specify any configuration for deletion; Terraform will handle deletion automatically
# }

# data "aws_lb" "argocd_alb" {
#   name = "argocd"
# }

# output "alb_security_group_id" {
#   value = data.aws_lb.argocd_alb.security_groups[0]
# }

# data "aws_security_groups" "alb_argocd" {
#   filter {
#     name   = "group-name"
#     values = ["*nodes*"]
#   }
# }

# # Delete alb argocd target group
# resource "null_resource" "argocd" {
  
#   provisioner "local-exec" {
#     command = "sleep 30; aws elbv2 delete-target-group --target-group-arn <your-target-group-arn>
# "
#   }

# }



# security groups associated to delete
resource "aws_security_group" "deleted" {
  # depends_on = [null_resource.argocd]
  count = length(data.aws_security_groups.filtered.ids) + length(data.aws_security_groups.filtered_shared.ids)
  # depends_on = [data.aws_lb.argocd]
  # depends_on = [
  #   kubernetes_ingress_v1.argocd_ingress,
  #   var.kubernetes_ingress_v1_destroyed ? null : aws_security_group.deleted[count.index]
  # ]
  # Delete the security groups filtered by tag description
  provisioner "local-exec" {
    command = "sleep 60; aws ec2 delete-security-group --group-id ${concat(data.aws_security_groups.filtered.ids, data.aws_security_groups.filtered_shared.ids)[count.index]}"
  }

  # # Add a lifecycle dependency to trigger this resource only when the specified kubernetes_ingress_v1 resource is not destroyed
  # lifecycle {
  #   ignore_changes = [count]
  # }
}
