module "eks_alb" {
  source = ".././modules/eks_alb"

  helm_release_loadbalancer_controller_name                                  = var.helm_release_loadbalancer_controller_name
  helm_release_loadbalancer_controller_repository                            = var.helm_release_loadbalancer_controller_repository
  helm_release_loadbalancer_controller_chart                                 = var.helm_release_loadbalancer_controller_chart
  helm_release_loadbalancer_controller_namespace                             = var.helm_release_loadbalancer_controller_namespace
  helm_release_loadbalancer_controller_set_image_name                        = var.helm_release_loadbalancer_controller_set_image_name
  helm_release_loadbalancer_controller_set_image_value                       = var.helm_release_loadbalancer_controller_set_image_value
  vpc_id                                                                     = data.aws_vpc.vpc.id
  aws_region                                                                 = var.aws_region
  aws_eks_cluster_auth_cluster_name                                          = data.aws_eks_cluster_auth.cluster.id
  aws_iam_policy_lbc_iam_policy_name                                         = var.aws_iam_policy_lbc_iam_policy_name
  aws_iam_policy_lbc_iam_policy_path                                         = var.aws_iam_policy_lbc_iam_policy_path
  aws_iam_policy_lbc_iam_policy_description                                  = var.aws_iam_policy_lbc_iam_policy_description
  aws_iam_role_lbc_iam_role_name                                             = var.aws_iam_role_lbc_iam_role_name
  kubernetes_ingress_class_v1_ingress_class_default_metadata_name            = var.kubernetes_ingress_class_v1_ingress_class_default_metadata_name
  kubernetes_ingress_class_v1_ingress_class_default_metadata_annotations     = var.kubernetes_ingress_class_v1_ingress_class_default_metadata_annotations
  kubernetes_ingress_class_v1_ingress_class_default_spec                     = var.kubernetes_ingress_class_v1_ingress_class_default_spec
  helm_release_loadbalancer_controller_set_service_account_create_name       = var.helm_release_loadbalancer_controller_set_service_account_create_name
  helm_release_loadbalancer_controller_set_service_account_create_value      = var.helm_release_loadbalancer_controller_set_service_account_create_value
  helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_name  = var.helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_name
  helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_value = var.helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_value
  helm_release_loadbalancer_controller_set_service_account_name              = var.helm_release_loadbalancer_controller_set_service_account_name
  helm_release_loadbalancer_controller_set_service_account_value             = var.helm_release_loadbalancer_controller_set_service_account_value
  aws_autoscaling_attachment_alb_attachment_autoscaling_group_name           = data.aws_autoscaling_group.eks.name
  security_group                                                             = data.aws_security_group.all.id
  public_subnets                                                             = data.aws_subnets.public.ids
  eks_worker_node_id                                                         = data.aws_instances.eks_worker_node.ids
  # env                                                                        = local.env
  # region                                                                     = var.aws_region
  argocd_version                                                                      = var.argocd_version # "3.35.4"
  loadbalancer_dns                                                                    = module.eks_alb.alb_dns_name
  fqdn                                                                                = module.eks_alb.alb_dns_name
  aws_iam_role_lbc_iam_role_assume_role_policy                                        = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
       "Principal": {
          "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${data.aws_iam_openid_connect_provider.eks_cluster_netflix.url}"
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
            "StringEquals": {  
              "${replace(data.aws_iam_openid_connect_provider.eks_cluster_netflix.arn, "arn:aws:iam::951507339182:oidc-provider/", "")}:aud": "sts.amazonaws.com",      
              "${replace(data.aws_iam_openid_connect_provider.eks_cluster_netflix.arn, "arn:aws:iam::951507339182:oidc-provider/", "")}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
            }
          }       
    }
  ]
}
EOF
  kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class         = var.kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class
  kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class_value   = var.kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class_value
  kubernetes_ingress_class_v1_ingress_class_default_spec_controller_alb               = var.kubernetes_ingress_class_v1_ingress_class_default_spec_controller_alb
  aws_iam_role_lbc_iam_role_tags                                                      = var.aws_iam_role_lbc_iam_role_tags
  data_http_lbc_iam_policy_url                                                        = var.data_http_lbc_iam_policy_url
  data_http_lbc_iam_policy_request_headers_accept                                     = var.data_http_lbc_iam_policy_request_headers_accept
  kubernetes_ingress_v1_argocd_ingress_metadata_name                                  = var.kubernetes_ingress_v1_argocd_ingress_metadata_name
  kubernetes_ingress_v1_argocd_ingress_metadata_namespace                             = var.kubernetes_ingress_v1_argocd_ingress_metadata_namespace
  kubernetes_ingress_v1_argocd_ingress_labels_name_argocd_server                      = var.kubernetes_ingress_v1_argocd_ingress_labels_name_argocd_server
  kubernetes_ingress_v1_argocd_ingress_labels_value_argocd_server                     = var.kubernetes_ingress_v1_argocd_ingress_labels_value_argocd_server
  kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class                      = var.kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class
  kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name                 = var.kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name
  kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol                   = var.kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol
  kubernetes_ingress_v1_argocd_ingress_annotations_scheme                             = var.kubernetes_ingress_v1_argocd_ingress_annotations_scheme
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol               = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port                   = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path                   = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path
  kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect                 = var.kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds       = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds        = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds
  kubernetes_ingress_v1_argocd_ingress_annotations_success_codes                      = var.kubernetes_ingress_v1_argocd_ingress_annotations_success_codes
  kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count            = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count
  kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count          = var.kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count
  kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_name              = var.kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_name
  kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_port              = var.kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_port
  kubernetes_ingress_v1_argocd_ingress_tls_secret_name                                = var.kubernetes_ingress_v1_argocd_ingress_tls_secret_name
  kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_value                = var.kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_value
  kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name_value           = var.kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name_value
  kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol_value             = var.kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol_value
  kubernetes_ingress_v1_argocd_ingress_annotations_scheme_value                       = var.kubernetes_ingress_v1_argocd_ingress_annotations_scheme_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol_value         = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port_value             = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path_value             = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path_value
  kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect_value           = var.kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds_value = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds_value  = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds_value
  kubernetes_ingress_v1_argocd_ingress_annotations_success_codes_value                = var.kubernetes_ingress_v1_argocd_ingress_annotations_success_codes_value
  kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count_value      = var.kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count_value
  kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count_value    = var.kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count_value
  aws_lb_eks_name                                                                     = var.aws_lb_eks_name
  aws_lb_eks_internal_bool                                                            = var.aws_lb_eks_internal_bool
  aws_lb_eks_load_balancer_type                                                       = var.aws_lb_eks_load_balancer_type
  aws_lb_target_group_netflix_tg_name                                                 = var.aws_lb_target_group_netflix_tg_name
  aws_lb_target_group_netflix_tg_port                                                 = var.aws_lb_target_group_netflix_tg_port
  aws_lb_target_group_netflix_tg_protocol                                             = var.aws_lb_target_group_netflix_tg_protocol
  aws_lb_listener_http_listener_netflix_port                                          = var.aws_lb_listener_http_listener_netflix_port
  aws_lb_listener_http_listener_netflix_protocol                                      = var.aws_lb_listener_http_listener_netflix_protocol
  aws_lb_listener_http_listener_netflix_default_action_type                           = var.aws_lb_listener_http_listener_netflix_default_action_type
  aws_lb_target_group_netflix_tg_health_check                                         = var.aws_lb_target_group_netflix_tg_health_check
  aws_lb_target_group_eks_tg_sonarqube_name                                           = var.aws_lb_target_group_eks_tg_sonarqube_name
  aws_lb_target_group_eks_tg_sonarqube_port                                           = var.aws_lb_target_group_eks_tg_sonarqube_port
  aws_lb_target_group_eks_tg_sonarqube_protocol                                       = var.aws_lb_target_group_eks_tg_sonarqube_protocol
  aws_lb_target_group_eks_tg_sonarqube_health_check                                   = var.aws_lb_target_group_eks_tg_sonarqube_health_check
  aws_lb_listener_http_listener_sonarqube_port                                        = var.aws_lb_listener_http_listener_sonarqube_port
  aws_lb_listener_http_listener_sonarqube_protocol                                    = var.aws_lb_listener_http_listener_sonarqube_protocol
  aws_lb_listener_http_listener_sonarqube_default_action_type                         = var.aws_lb_listener_http_listener_sonarqube_default_action_type
  aws_lb_target_group_eks_tg_grafana_name                                             = var.aws_lb_target_group_eks_tg_grafana_name
  aws_lb_target_group_eks_tg_grafana_port                                             = var.aws_lb_target_group_eks_tg_grafana_port
  aws_lb_target_group_eks_tg_grafana_protocol                                         = var.aws_lb_target_group_eks_tg_grafana_protocol
  aws_lb_target_group_eks_tg_grafana_health_check                                     = var.aws_lb_target_group_eks_tg_grafana_health_check
  aws_lb_listener_http_listener_grafana_port                                          = var.aws_lb_listener_http_listener_grafana_port
  aws_lb_listener_http_listener_grafana_protocol                                      = var.aws_lb_listener_http_listener_grafana_protocol
  aws_lb_listener_http_listener_grafana_default_action_type                           = var.aws_lb_listener_http_listener_grafana_default_action_type
  aws_lb_target_group_eks_tg_prometheus_name                                          = var.aws_lb_target_group_eks_tg_prometheus_name
  aws_lb_target_group_eks_tg_prometheus_port                                          = var.aws_lb_target_group_eks_tg_prometheus_port
  aws_lb_target_group_eks_tg_prometheus_protocol                                      = var.aws_lb_target_group_eks_tg_prometheus_protocol
  aws_lb_target_group_eks_tg_prometheus_health_check                                  = var.aws_lb_target_group_eks_tg_prometheus_health_check
  aws_lb_listener_http_listener_prometheus_port                                       = var.aws_lb_listener_http_listener_prometheus_port
  aws_lb_listener_http_listener_prometheus_protocol                                   = var.aws_lb_listener_http_listener_prometheus_protocol
  aws_lb_listener_http_listener_prometheus_default_action_type                        = var.aws_lb_listener_http_listener_prometheus_default_action_type
  aws_lb_target_group_eks_tg_node_exporter_name                                       = var.aws_lb_target_group_eks_tg_node_exporter_name
  aws_lb_target_group_eks_tg_node_exporter_port                                       = var.aws_lb_target_group_eks_tg_node_exporter_port
  aws_lb_target_group_eks_tg_node_exporter_protocol                                   = var.aws_lb_target_group_eks_tg_node_exporter_protocol
  aws_lb_target_group_eks_tg_node_exporter_health_check                               = var.aws_lb_target_group_eks_tg_node_exporter_health_check
  aws_lb_listener_http_listener_node_exporter_port                                    = var.aws_lb_listener_http_listener_node_exporter_port
  aws_lb_listener_http_listener_node_exporter_protocol                                = var.aws_lb_listener_http_listener_node_exporter_protocol
  aws_lb_listener_http_listener_node_exporter_default_action_type                     = var.aws_lb_listener_http_listener_node_exporter_default_action_type
  kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_name                 = var.kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_name
  null_resource_get_argocd_admin_password_remote_exec_inline                          = var.null_resource_get_argocd_admin_password_remote_exec_inline
  null_resource_get_argocd_admin_password_connection_type                             = var.null_resource_get_argocd_admin_password_connection_type
  null_resource_get_argocd_admin_password_connection_user                             = var.null_resource_get_argocd_admin_password_connection_user
  null_resource_get_argocd_admin_password_connection_private_key                      = "${path.module}/web-ec2.pem"
  # null_resource_output_argocd_admin_password_remote_exec_inline                       = var.null_resource_output_argocd_admin_password_remote_exec_inline
  null_resource_output_argocd_admin_password_connection_type        = var.null_resource_output_argocd_admin_password_connection_type
  null_resource_output_argocd_admin_password_connection_user        = var.null_resource_output_argocd_admin_password_connection_user
  null_resource_output_argocd_admin_password_connection_private_key = "${path.module}/web-ec2.pem"
  # null_resource_yaml_to_s3_local_exec_command                       = var.null_resource_yaml_to_s3_local_exec_command
  # null_resource_s3_to_instance_remote_exec_inline                   = var.null_resource_s3_to_instance_remote_exec_inline
  # null_resource_ingress_alb_creation_remote_exec_inline             = var.null_resource_ingress_alb_creation_remote_exec_inline
  # null_resource_yaml_to_s3_connection_type                          = var.null_resource_yaml_to_s3_connection_type
  # null_resource_yaml_to_s3_connection_user                          = var.null_resource_yaml_to_s3_connection_user
  # null_resource_yaml_to_s3_connection_private_key                   = "${path.module}/web-ec2.pem"
  # null_resource_ingress_alb_creation_connection_type                = var.null_resource_ingress_alb_creation_connection_type
  # null_resource_ingress_alb_creation_connection_user                = var.null_resource_ingress_alb_creation_connection_user
  # null_resource_ingress_alb_creation_connection_private_key         = "${path.module}/web-ec2.pem"
  aws_lb_argocd_name                                             = var.aws_lb_argocd_name
  aws_lb_argocd_internal_bool                                    = var.aws_lb_argocd_internal_bool
  aws_lb_argocd_load_balancer_type                               = var.aws_lb_argocd_load_balancer_type
  aws_lb_target_group_argocd_name                                = var.aws_lb_target_group_argocd_name
  aws_lb_target_group_argocd_port                                = var.aws_lb_target_group_argocd_port
  aws_lb_target_group_argocd_protocol                            = var.aws_lb_target_group_argocd_protocol
  aws_lb_target_group_argocd_health_check                        = var.aws_lb_target_group_argocd_health_check
  aws_lb_listener_http_listener_argocd_port                      = var.aws_lb_listener_http_listener_argocd_port
  aws_lb_listener_http_listener_argocd_protocol                  = var.aws_lb_listener_http_listener_argocd_protocol
  aws_lb_listener_http_listener_argocd_default_action_type       = var.aws_lb_listener_http_listener_argocd_default_action_type
  aws_security_group_rule_argocd_port_type                       = var.aws_security_group_rule_argocd_port_type
  aws_security_group_rule_argocd_port_protocol                   = var.aws_security_group_rule_argocd_port_protocol
  aws_security_group_rule_argocd_port_cidr_blocks                = var.aws_security_group_rule_argocd_port_cidr_blocks
  null_resource_get_argocd_port_remote_exec_inline               = var.null_resource_get_argocd_port_remote_exec_inline
  null_resource_get_argocd_port_connection_user                  = var.null_resource_get_argocd_port_connection_user
  null_resource_get_argocd_port_connection_private_key           = "${path.module}/web-ec2.pem"
  null_resource_output_argocd_port_connection_type               = var.null_resource_output_argocd_port_connection_type
  null_resource_output_argocd_port_connection_user               = var.null_resource_output_argocd_port_connection_user
  null_resource_output_output_argocd_port_connection_private_key = "${path.module}/web-ec2.pem"
  null_resource_get_argocd_port_connection_type                  = var.null_resource_get_argocd_port_connection_type
  null_resource_output_argocd_port_remote_exec_inline            = var.null_resource_output_argocd_port_remote_exec_inline
}


# locals {
#   env    = "dev"
#   region = "us-east-1"
# }