# Install AWS Load Balancer Controller using HELM

# Resource: Helm Release 
resource "helm_release" "loadbalancer_controller" {
  depends_on = [aws_iam_role.lbc_iam_role]            
  name       = var.helm_release_loadbalancer_controller_name # "aws-load-balancer-controller"

  repository = var.helm_release_loadbalancer_controller_repository # "https://aws.github.io/eks-charts"
  chart      = var.helm_release_loadbalancer_controller_chart # "aws-load-balancer-controller"

  namespace = var.helm_release_loadbalancer_controller_namespace # "kube-system"     

  # Value changes based on your Region (Below is for us-east-1)
  set {
    name = var.helm_release_loadbalancer_controller_set_image_name # "image.repository"
    value = var.helm_release_loadbalancer_controller_set_image_value # "602401143452.dkr.ecr.us-west-2.amazonaws.com/amazon/aws-load-balancer-controller" 
    # Changes based on Region - This is for us-east-1 Additional Reference: https://docs.aws.amazon.com/eks/latest/userguide/add-ons-images.html
  }       

  set {
    name  = var.helm_release_loadbalancer_controller_set_service_account_create_name # "serviceAccount.create"
    value = var.helm_release_loadbalancer_controller_set_service_account_create_value # "true"
  }
  
  # below value is to fix an issue facing argocd deployment using manifest
  set {
    name  = var.helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_name #  "enableServiceMutatorWebhook"
    value = var.helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_value # "false"
  }

  set {
    name  = var.helm_release_loadbalancer_controller_set_service_account_name # "serviceAccount.name"
    value = var.helm_release_loadbalancer_controller_set_service_account_value # "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.lbc_iam_role.arn}"
  }

  set {
    name  = "vpcId"
    value = "${var.vpc_id}"
  }  

  set {
    name  = "region"
    value = "${var.aws_region}"
  }    

  set {
    name  = "clusterName"
    value = "${var.aws_eks_cluster_auth_cluster_name}"
  }    
    
}