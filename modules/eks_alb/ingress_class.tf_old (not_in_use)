# Resource: Kubernetes Ingress Class
resource "kubernetes_ingress_class_v1" "ingress_class_default" {
  depends_on = [helm_release.loadbalancer_controller]
  metadata {
    name = var.kubernetes_ingress_class_v1_ingress_class_default_metadata_name # "aws-eks-ingress-class"
    annotations = {
      "${var.kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class}" = var.kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class_value # "ingressclass.kubernetes.io/is-default-class" = "true"
    }
  }  
  spec {
    controller = var.kubernetes_ingress_class_v1_ingress_class_default_spec_controller_alb # "ingress.k8s.aws/alb"
  }
}

# Additional Note
# 1. You can mark a particular IngressClass as the default for your cluster. 
# 2. Setting the ingressclass.kubernetes.io/is-default-class annotation to true on an IngressClass resource will ensure that new Ingresses without an ingressClassName field specified will be assigned this default IngressClass.  
# 3. Reference: https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.3/guide/ingress/ingress_class/