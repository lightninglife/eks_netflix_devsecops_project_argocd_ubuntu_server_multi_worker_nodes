resource "aws_security_group_rule" "argocd_port" {
  type              = var.aws_security_group_rule_argocd_port_type # "ingress"
  from_port         = data.aws_s3_object.argocd_port.body # argocd_port
  to_port           = data.aws_s3_object.argocd_port.body # argocd_port
  protocol          = var.aws_security_group_rule_argocd_port_protocol # "tcp"
  cidr_blocks       = var.aws_security_group_rule_argocd_port_cidr_blocks # ["10.0.0.0/16"]  # Allow traffic from this CIDR block
  security_group_id = data.aws_security_groups.all.ids[0]
  depends_on = [null_resource.output_argocd_port]
}


resource "null_resource" "get_argocd_port" {
  provisioner "remote-exec" {
    inline = [
      "ssh -o StrictHostKeyChecking=no -i \"web-ec2.pem\" ubuntu@${data.aws_instances.eks_netflix.private_ips[0]} \"${var.null_resource_get_argocd_port_remote_exec_inline}\""
    ]

  connection {
    type        = var.null_resource_get_argocd_port_connection_type # "ssh"
    user        = var.null_resource_get_argocd_port_connection_user # "your_ssh_user"
    private_key = file(var.null_resource_get_argocd_port_connection_private_key)
    host        = data.aws_instance.bastion.public_ip
    # insecure = true
    
    }
  }
}


resource "null_resource" "output_argocd_port" {
  provisioner "remote-exec" {
    inline = [
      # var.null_resource_output_argocd_admin_password_remote_exec_inline # echo $ARGO_PWD
      "ssh -o StrictHostKeyChecking=no -i \"web-ec2.pem\" -y ubuntu@${data.aws_instances.eks_netflix.private_ips[0]} \"${var.null_resource_output_argocd_port_remote_exec_inline}\""  ### \"sudo -u ubuntu /usr/bin/aws s3 cp /tmp/argocd_port_0.txt s3://eks-netflix-argocd-ubuntu/argocd_port_0.txt\""
    ]
  connection {
    type        = var.null_resource_output_argocd_port_connection_type # "ssh"
    user        = var.null_resource_output_argocd_port_connection_user # "your_ssh_user"
    private_key = file(var.null_resource_output_output_argocd_port_connection_private_key)
    host        = data.aws_instance.bastion.public_ip
    }
  }

  depends_on = [null_resource.get_argocd_port]
}
