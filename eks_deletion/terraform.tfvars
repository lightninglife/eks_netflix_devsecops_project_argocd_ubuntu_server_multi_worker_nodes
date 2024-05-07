null_resource_patch_ingress_remote_exec_inline = "sudo -u ubuntu kubectl patch ingress argocd-ingress -n argocd -p '{\\\"metadata\\\":{\\\"finalizers\\\":[]}}' --type=merge\""
null_resource_patch_ingress_connection_type    = "ssh"
null_resource_patch_ingress_connection_user    = "ubuntu"