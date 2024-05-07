# argocd application - netflix
null_resource_argocd_ready_remote_exec_inline = "sudo -u ubuntu /usr/bin/kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server --namespace=argocd\""
null_resource_wait_for_argocd_connection_type = "ssh"
null_resource_wait_for_argocd_connection_user = "ubuntu"
argocd_application_netflix_metadata_name      = "netflix"
argocd_application_netflix_metadata_namespace = "argocd"
argocd_application_netflix_spec_project_name  = "default"
argocd_application_netflix_spec_source = {
  repo_url        = "https://github.com/lightninglife/DevSecOps-Project.git"
  target_revision = "HEAD"
  path            = "Kubernetes"
}
argocd_application_netflix_spec_source_directory = {
  recurse = true
}
argocd_application_netflix_spec_destination = {
  server    = "https://kubernetes.default.svc"
  namespace = "default"
}
argocd_application_netflix_spec_sync_policy = {
  sync_options = ["CreateNamespace=true"]
}
argocd_application_netflix_spec_sync_policy_automated = {
  prune     = true
  self_heal = true
}

aws_security_group_rule_8080_type        = "ingress"
aws_security_group_rule_8080_from_port   = 8080
aws_security_group_rule_8080_to_port     = 8080
aws_security_group_rule_8080_protocol    = "tcp"
aws_security_group_rule_8080_cidr_blocks = ["10.0.0.0/16"]
