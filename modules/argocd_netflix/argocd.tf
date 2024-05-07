# Wait for the Argo CD server to become ready
resource "null_resource" "argocd_ready" {
  # depends_on = [kubernetes_ingress_v1.argocd_ingress]
  # count = length(data.aws_instances.eks_netflix.private_ips)
  # provisioner "remote-exec" {
  #   inline = [
  #      "ssh -i \"web-ec2.pem\"  ubuntu@${element(data.aws_instances.eks_netflix.private_ips, count.index)} \"${var.null_resource_argocd_ready_remote_exec_inline}" # "kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server --namespace=argocd"
  #   ]
  # }

   provisioner "remote-exec" {
    inline = [
       "ssh -i \"web-ec2.pem\"  ubuntu@${data.aws_instances.eks_netflix.private_ips[0]} \"${var.null_resource_argocd_ready_remote_exec_inline}" # "kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=argocd-server --namespace=argocd"
    ]
  }

  connection {
    type        = var.null_resource_wait_for_argocd_connection_type # "ssh"
    user        = var.null_resource_wait_for_argocd_connection_user # "your_ssh_user"
    private_key = file(var.null_resource_wait_for_argocd_connection_private_key)
    host        = data.aws_instance.bastion.public_ip
  }
}

resource "argocd_application" "netflix" {
  depends_on = [null_resource.argocd_ready]
  metadata {
    name      = var.argocd_application_netflix_metadata_name # "netflix"
    namespace = var.argocd_application_netflix_metadata_namespace # "argocd"
  }

  spec {
    project = var.argocd_application_netflix_spec_project_name # "default"

    source {
      repo_url        = var.argocd_application_netflix_spec_source["repo_url"] # "https://github.com/lightninglife/DevSecOps-Project.git"
      target_revision = var.argocd_application_netflix_spec_source["target_revision"] # "HEAD"
      path            = var.argocd_application_netflix_spec_source["path"] # "Kubernetes"
      directory {
        recurse =  var.argocd_application_netflix_spec_source_directory["recurse"] # true
      }
    }

    destination {
      server     = var.argocd_application_netflix_spec_destination["server"] # "https://kubernetes.default.svc"
      namespace = var.argocd_application_netflix_spec_destination["namespace"] # ["argocd"]
    }

    sync_policy {
      sync_options = var.argocd_application_netflix_spec_sync_policy["sync_options"] # ["CreateNamespace=true"]

      automated {
        prune    = var.argocd_application_netflix_spec_sync_policy_automated["prune"] # true
        self_heal = var.argocd_application_netflix_spec_sync_policy_automated["self_heal"] # true
      }
    }
  }
}