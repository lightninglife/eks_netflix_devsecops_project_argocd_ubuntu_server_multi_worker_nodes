### eks alb
# controller
variable "helm_release_loadbalancer_controller_set_service_account_create_name" {
  description = "Name of the Kubernetes service account to create for the load balancer controller."
  type        = string
}

variable "helm_release_loadbalancer_controller_set_service_account_create_value" {
  description = "Value of the Kubernetes service account to create for the load balancer controller."
  type        = string
}

variable "helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_name" {
  description = "Name of the Kubernetes service account for Enable Service Mutator Webhook."
  type        = string
}

variable "helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_value" {
  description = "Value of the Kubernetes service account for Enable Service Mutator Webhook."
  type        = string
}

variable "helm_release_loadbalancer_controller_set_service_account_name" {
  description = "Name of the Kubernetes service account for the load balancer controller."
  type        = string
}

variable "helm_release_loadbalancer_controller_set_service_account_value" {
  description = "Value of the Kubernetes service account for the load balancer controller."
  type        = string
}

variable "helm_release_loadbalancer_controller_name" {
  type        = string
  description = "The name of the Helm release for the AWS Load Balancer Controller."
}

variable "helm_release_loadbalancer_controller_repository" {
  type        = string
  description = "The repository URL from which to fetch the Helm chart for the AWS Load Balancer Controller."
}

variable "helm_release_loadbalancer_controller_chart" {
  type        = string
  description = "The name of the Helm chart for the AWS Load Balancer Controller."
}

variable "helm_release_loadbalancer_controller_namespace" {
  type        = string
  description = "The Kubernetes namespace in which to install the AWS Load Balancer Controller."
}

variable "helm_release_loadbalancer_controller_set_image_name" {
  type        = string
  description = "The name of the Helm chart value to set the image repository for the AWS Load Balancer Controller."
}

variable "helm_release_loadbalancer_controller_set_image_value" {
  type        = string
  description = "The value of the image repository for the AWS Load Balancer Controller."
}

variable "aws_region" {
  type        = string
  description = "The AWS region where the AWS Load Balancer Controller will be deployed."
}

variable "argocd_version" {
  type = string
}


# iam
variable "aws_iam_policy_lbc_iam_policy_name" {
  type        = string
  description = "The name of the AWS IAM policy for the Load Balancer Controller."
}

variable "aws_iam_policy_lbc_iam_policy_path" {
  type        = string
  description = "The path for the AWS IAM policy for the Load Balancer Controller."
}

variable "aws_iam_policy_lbc_iam_policy_description" {
  type        = string
  description = "The description of the AWS IAM policy for the Load Balancer Controller."
}

variable "aws_iam_role_lbc_iam_role_name" {
  type        = string
  description = "The name of the AWS IAM role for the Load Balancer Controller."
}

variable "aws_iam_role_lbc_iam_role_tags" {
  description = "Tags for the IAM role used by the load balancer controller"
  type        = string
}


# ingress
variable "kubernetes_ingress_class_v1_ingress_class_default_metadata_name" {
  type        = string
  description = "The name of the Kubernetes Ingress Class metadata."
}

variable "kubernetes_ingress_class_v1_ingress_class_default_metadata_annotations" {
  type        = map(string)
  description = "Annotations for the Kubernetes Ingress Class metadata."
}

variable "kubernetes_ingress_class_v1_ingress_class_default_spec" {
  type        = string
  description = "The controller specification for the Kubernetes Ingress Class."
}

variable "kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class" {
  description = "Default annotations for the default class in Kubernetes IngressClass"
  type        = string
}

variable "kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class_value" {
  description = "Default value for the default class annotation in Kubernetes IngressClass"
  type        = string
}

variable "kubernetes_ingress_class_v1_ingress_class_default_spec_controller_alb" {
  description = "Controller configuration for ALB in Kubernetes IngressClass"
  type        = string
}

variable "data_http_lbc_iam_policy_url" {
  description = "The URL for the IAM policy document for the data HTTP load balancer controller"
  type        = string
}

variable "data_http_lbc_iam_policy_request_headers_accept" {
  description = "The value for the 'Accept' header in the IAM policy document for the data HTTP load balancer controller"
  type        = string
}

# ingress
variable "kubernetes_ingress_v1_argocd_ingress_metadata_name" {
  description = "Name of the Ingress resource for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_metadata_namespace" {
  description = "Namespace of the Ingress resource for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_labels_name_argocd_server" {
  description = "Name label for ArgoCD server"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_labels_value_argocd_server" {
  description = "Value label for ArgoCD server"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class" {
  description = "Ingress class annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name" {
  description = "Load balancer name annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol" {
  description = "Backend protocol annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_scheme" {
  description = "Scheme annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol" {
  description = "Healthcheck protocol annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port" {
  description = "Healthcheck port annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path" {
  description = "Healthcheck path annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect" {
  description = "Force SSL redirect annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds" {
  description = "Healthcheck interval in seconds annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds" {
  description = "Healthcheck timeout in seconds annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_success_codes" {
  description = "Success codes annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count" {
  description = "Healthy threshold count annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count" {
  description = "Unhealthy threshold count annotation for ArgoCD"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_name" {
  description = "Name of the default backend service for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_port" {
  description = "Port of the default backend service for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_tls_secret_name" {
  description = "Name of the TLS secret for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_value" {
  description = "Value for the 'ingress.class' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/load-balancer-name' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/backend-protocol' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_scheme_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/scheme' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthcheck-protocol' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthcheck-port' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthcheck-path' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/force-ssl-redirect' annotation for ArgoCD Ingress"
  type        = string
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthcheck-interval-seconds' annotation for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthcheck-timeout-seconds' annotation for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_success_codes_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/success-codes' annotation for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/healthy-threshold-count' annotation for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count_value" {
  description = "Value for the 'alb.ingress.kubernetes.io/unhealthy-threshold-count' annotation for ArgoCD Ingress"
  type        = number
}

variable "kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_name" {
  description = "Annotation key for specifying the Ingress class"
  type        = string
}


# alb & target group - netflix
variable "aws_lb_eks_name" {
  description = "Name of the Elastic Load Balancer (ELB) for EKS"
  type        = string
}

variable "aws_lb_eks_internal_bool" {
  description = "Boolean indicating whether the ELB for EKS is internal (true/false)"
  type        = bool
}

variable "aws_lb_eks_load_balancer_type" {
  description = "Type of load balancer for EKS (e.g., application, network)"
  type        = string
}

variable "aws_lb_target_group_netflix_tg_name" {
  description = "Name of the target group for Netflix on the ELB"
  type        = string
}

variable "aws_lb_target_group_netflix_tg_port" {
  description = "Port for the target group for Netflix on the ELB"
  type        = number
}

variable "aws_lb_target_group_netflix_tg_protocol" {
  description = "Protocol for the target group for Netflix on the ELB (e.g., HTTP, HTTPS)"
  type        = string
}

variable "aws_lb_target_group_netflix_tg_health_check" {
  description = "Health check configuration for the target group"
  type = object({
    path                = string
    port                = string
    protocol            = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
    matcher             = string
  })
}


variable "aws_lb_listener_http_listener_netflix_port" {
  description = "Port for the HTTP listener for Netflix on the ELB"
  type        = number
}

variable "aws_lb_listener_http_listener_netflix_protocol" {
  description = "Protocol for the HTTP listener for Netflix on the ELB (e.g., HTTP, HTTPS)"
  type        = string
}

variable "aws_lb_listener_http_listener_netflix_default_action_type" {
  description = "Type of default action for the HTTP listener for Netflix on the ELB"
  type        = string
}


# SonarQube
variable "aws_lb_target_group_eks_tg_sonarqube_name" {
  description = "Name of the Target Group for SonarQube on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_sonarqube_port" {
  description = "Port for the Target Group for SonarQube on the ELB"
  type        = number
}

variable "aws_lb_target_group_eks_tg_sonarqube_protocol" {
  description = "Protocol for the Target Group for SonarQube on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_sonarqube_health_check" {
  description = "Health check configuration for the Target Group for SonarQube on the ELB"
  type = object({
    path                = string
    port                = string
    protocol            = string
    interval            = number
    timeout             = number
    healthy_threshold   = number
    unhealthy_threshold = number
    matcher             = string
  })
}

variable "aws_lb_listener_http_listener_sonarqube_port" {
  description = "Port for the HTTP listener for SonarQube on the ELB"
  type        = number
}

variable "aws_lb_listener_http_listener_sonarqube_protocol" {
  description = "Protocol for the HTTP listener for SonarQube on the ELB"
  type        = string
}

variable "aws_lb_listener_http_listener_sonarqube_default_action_type" {
  description = "Type of default action for the HTTP listener for SonarQube on the ELB"
  type        = string
}

# alb & target group - Grafana

variable "aws_lb_target_group_eks_tg_grafana_name" {
  description = "Name of the Target Group for Grafana on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_grafana_port" {
  description = "Port for the Target Group for Grafana on the ELB"
  type        = number
}

variable "aws_lb_target_group_eks_tg_grafana_protocol" {
  description = "Protocol for the Target Group for Grafana on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_grafana_health_check" {
  description = "Health check configuration for the Target Group for Grafana on the ELB"
  type        = map(string)
}

variable "aws_lb_listener_http_listener_grafana_port" {
  description = "Port for the HTTP listener for Grafana on the ELB"
  type        = number
}

variable "aws_lb_listener_http_listener_grafana_protocol" {
  description = "Protocol for the HTTP listener for Grafana on the ELB"
  type        = string
}

variable "aws_lb_listener_http_listener_grafana_default_action_type" {
  description = "Type of default action for the HTTP listener for Grafana on the ELB"
  type        = string
}

# alb & target group - Prometheus
variable "aws_lb_target_group_eks_tg_prometheus_name" {
  description = "Name of the Target Group for Prometheus on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_prometheus_port" {
  description = "Port for the Target Group for Prometheus on the ELB"
  type        = number
}

variable "aws_lb_target_group_eks_tg_prometheus_protocol" {
  description = "Protocol for the Target Group for Prometheus on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_prometheus_health_check" {
  description = "Health check configuration for the Target Group for Prometheus on the ELB"
  type        = map(string)
}

variable "aws_lb_listener_http_listener_prometheus_port" {
  description = "Port for the HTTP listener for Prometheus on the ELB"
  type        = number
}

variable "aws_lb_listener_http_listener_prometheus_protocol" {
  description = "Protocol for the HTTP listener for Prometheus on the ELB"
  type        = string

}

variable "aws_lb_listener_http_listener_prometheus_default_action_type" {
  description = "Type of default action for the HTTP listener for Prometheus on the ELB"
  type        = string
}

# alb & target group - Node Exporter
variable "aws_lb_target_group_eks_tg_node_exporter_name" {
  description = "Name of the Target Group for Node Exporter on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_node_exporter_port" {
  description = "Port for the Target Group for Node Exporter on the ELB"
  type        = number
}

variable "aws_lb_target_group_eks_tg_node_exporter_protocol" {
  description = "Protocol for the Target Group for Node Exporter on the ELB"
  type        = string
}

variable "aws_lb_target_group_eks_tg_node_exporter_health_check" {
  description = "Health check configuration for the Target Group for Node Exporter on the ELB"
  type        = map(string)
}

variable "aws_lb_listener_http_listener_node_exporter_port" {
  description = "Port for the HTTP listener for Node Exporter on the ELB"
  type        = number
}

variable "aws_lb_listener_http_listener_node_exporter_protocol" {
  description = "Protocol for the HTTP listener for Node Exporter on the ELB"
  type        = string
}

variable "aws_lb_listener_http_listener_node_exporter_default_action_type" {
  description = "Type of default action for the HTTP listener for Node Exporter on the ELB"
  type        = string
}

# argocd credentials
variable "null_resource_get_argocd_admin_password_remote_exec_inline" {
  type = string
  # Replace the value with your actual command for fetching the ArgoCD admin password using remote-exec provisioner
}

variable "null_resource_get_argocd_admin_password_connection_type" {
  type = string
  # Specify the connection type (e.g., ssh)
}

variable "null_resource_get_argocd_admin_password_connection_user" {
  type = string
  # Specify the username used for the connection
}


# variable "null_resource_output_argocd_admin_password_remote_exec_inline" {
#   type = string
#   # Replace the value with your actual command for outputting the ArgoCD admin password using remote-exec provisioner
# }

variable "null_resource_output_argocd_admin_password_connection_type" {
  type = string
  # Specify the connection type (e.g., ssh)
}

variable "null_resource_output_argocd_admin_password_connection_user" {
  type = string
  # Specify the username used for the connection
}

# alb & target group - Argocd

variable "aws_lb_argocd_name" {
  type = string
}

variable "aws_lb_argocd_internal_bool" {
  type = bool
}

variable "aws_lb_argocd_load_balancer_type" {
  type = string
}

variable "aws_lb_target_group_argocd_name" {
  type = string
}

variable "aws_lb_target_group_argocd_port" {
  type = number
}

variable "aws_lb_target_group_argocd_protocol" {
  type = string
}

variable "aws_lb_target_group_argocd_health_check" {
  type = map(any)
}

variable "aws_lb_listener_http_listener_argocd_port" {
  type = number
}

variable "aws_lb_listener_http_listener_argocd_protocol" {
  type = string
}

variable "aws_lb_listener_http_listener_argocd_default_action_type" {
  type = string
}



# variable "null_resource_ingress_alb_creation_remote_exec_inline" {
#   type = string
# }

# variable "null_resource_yaml_to_s3_local_exec_command" {
#   type = string
# }

# variable "null_resource_s3_to_instance_remote_exec_inline" {
#   type = string
# }

# variable "null_resource_yaml_to_s3_connection_type" {
#   type = string
# }

# variable "null_resource_yaml_to_s3_connection_user" {
#   type = string
# }

# variable "null_resource_ingress_alb_creation_connection_type" {
#   type = string
# }

# variable "null_resource_ingress_alb_creation_connection_user" {
#   type = string
# }

# Security group for argocd 

variable "aws_security_group_rule_argocd_port_type" {
  description = "Type of traffic for the ArgoCD port rule"
  type        = string
  # Adjust the default value if needed
}

variable "aws_security_group_rule_argocd_port_protocol" {
  description = "Protocol for the ArgoCD port rule"
  type        = string
  # Adjust the default value if needed
}

variable "aws_security_group_rule_argocd_port_cidr_blocks" {
  description = "CIDR blocks for the ArgoCD port rule"
  type        = list(string)
  # Adjust the default value if needed
}

# Port for Argocd
variable "null_resource_get_argocd_port_remote_exec_inline" {
  description = "Inline script for remote-exec provisioner of null_resource to get ArgoCD port"
  type        = string
}

variable "null_resource_get_argocd_port_connection_type" {
  description = "Connection type for null_resource to get ArgoCD port"
  type        = string
}

variable "null_resource_get_argocd_port_connection_user" {
  description = "Connection user for null_resource to get ArgoCD port"
  type        = string
}

variable "null_resource_output_argocd_port_connection_type" {
  description = "Connection type for output null_resource to get ArgoCD port"
  type        = string
}

variable "null_resource_output_argocd_port_connection_user" {
  description = "Connection user for output null_resource to get ArgoCD port"
  type        = string
}

variable "null_resource_output_argocd_port_remote_exec_inline" {
  description = "Inline script for remote-exec provisioner of null_resource to output ArgoCD port"
  type        = string
}