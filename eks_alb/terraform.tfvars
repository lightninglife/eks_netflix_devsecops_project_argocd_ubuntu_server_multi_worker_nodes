# eks alb
helm_release_loadbalancer_controller_set_service_account_create_name       = "serviceAccount.create"
helm_release_loadbalancer_controller_set_service_account_create_value      = "true"
helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_name  = "enableServiceMutatorWebhook"
helm_release_loadbalancer_controller_set_enableServiceMutatorWebhook_value = "false"
helm_release_loadbalancer_controller_set_service_account_name              = "serviceAccount.name"
helm_release_loadbalancer_controller_set_service_account_value             = "aws-load-balancer-controller"
helm_release_loadbalancer_controller_name                                  = "aws-load-balancer-controller"
helm_release_loadbalancer_controller_repository                            = "https://aws.github.io/eks-charts"
helm_release_loadbalancer_controller_chart                                 = "aws-load-balancer-controller"
helm_release_loadbalancer_controller_namespace                             = "kube-system"
helm_release_loadbalancer_controller_set_image_name                        = "image.repository"
helm_release_loadbalancer_controller_set_image_value                       = "602401143452.dkr.ecr.us-east-1.amazonaws.com/amazon/aws-load-balancer-controller"
aws_region                                                                 = "us-east-1"
aws_iam_policy_lbc_iam_policy_name                                         = "eks-lbc-iam-policy"
aws_iam_policy_lbc_iam_policy_path                                         = "/"
aws_iam_policy_lbc_iam_policy_description                                  = "AWS Load Balancer Controller IAM Policy"
aws_iam_role_lbc_iam_role_name                                             = "eks-lbc-iam-role"
kubernetes_ingress_class_v1_ingress_class_default_metadata_name            = "eks-ingress-class"
kubernetes_ingress_class_v1_ingress_class_default_metadata_annotations = {
  "ingressclass.kubernetes.io/is-default-class" = "true"
}
kubernetes_ingress_class_v1_ingress_class_default_spec                            = "ingress.k8s.aws/alb"
argocd_version                                                                    = "3.35.4"
kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class       = "ingressclass.kubernetes.io/is-default-class"
kubernetes_ingress_class_v1_ingress_class_default_annotations_default_class_value = "true"
kubernetes_ingress_class_v1_ingress_class_default_spec_controller_alb             = "ingress.k8s.aws/alb"
aws_iam_role_lbc_iam_role_tags                                                    = "AWSLoadBalancerControllerIAMPolicy"
data_http_lbc_iam_policy_url                                                      = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
data_http_lbc_iam_policy_request_headers_accept                                   = "application/json"

# ingress
kubernetes_ingress_v1_argocd_ingress_metadata_name                                  = "argocd-server"
kubernetes_ingress_v1_argocd_ingress_metadata_namespace                             = "argocd"
kubernetes_ingress_v1_argocd_ingress_labels_name_argocd_server                      = "app.kubernetes.io/name"
kubernetes_ingress_v1_argocd_ingress_labels_value_argocd_server                     = "argocd-server"
kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class                      = "kubernetes.io/ingress.class"
kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_value                = "alb"
kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name                 = "alb.ingress.kubernetes.io/load-balancer-name"
kubernetes_ingress_v1_argocd_ingress_annotations_load_balancer_name_value           = "argocd"
kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol                   = "alb.ingress.kubernetes.io/backend-protocol"
kubernetes_ingress_v1_argocd_ingress_annotations_backend_protocol_value             = "HTTP"
kubernetes_ingress_v1_argocd_ingress_annotations_scheme                             = "alb.ingress.kubernetes.io/scheme"
kubernetes_ingress_v1_argocd_ingress_annotations_scheme_value                       = "internet-facing"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol               = "alb.ingress.kubernetes.io/healthcheck-protocol"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_protocol_value         = "HTTP"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port                   = "alb.ingress.kubernetes.io/healthcheck-port"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_port_value             = "traffic-port"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path                   = "alb.ingress.kubernetes.io/healthcheck-path"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_path_value             = "/"
kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect                 = "alb.ingress.kubernetes.io/force-ssl-redirect"
kubernetes_ingress_v1_argocd_ingress_annotations_force_ssl_redirect_value           = "false"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds       = "alb.ingress.kubernetes.io/healthcheck-interval-seconds"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_interval_seconds_value = 15
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds        = "alb.ingress.kubernetes.io/healthcheck-timeout-seconds"
kubernetes_ingress_v1_argocd_ingress_annotations_healthcheck_timeout_seconds_value  = 5
kubernetes_ingress_v1_argocd_ingress_annotations_success_codes                      = "alb.ingress.kubernetes.io/success-codes"
kubernetes_ingress_v1_argocd_ingress_annotations_success_codes_value                = 200
kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count            = "alb.ingress.kubernetes.io/healthy-threshold-count"
kubernetes_ingress_v1_argocd_ingress_annotations_healthy_threshold_count_value      = 2
kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count          = "alb.ingress.kubernetes.io/unhealthy-threshold-count"
kubernetes_ingress_v1_argocd_ingress_annotations_unhealthy_threshold_count_value    = 2
kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_name              = "argocd-server"
kubernetes_ingress_v1_argocd_ingress_spec_default_backend_service_port              = 80
kubernetes_ingress_v1_argocd_ingress_tls_secret_name                                = "argocd-secret"
kubernetes_ingress_v1_argocd_ingress_annotations_ingress_class_name                 = "alb"

# alb & target group - netflix
aws_lb_eks_name                         = "eks-netflix"
aws_lb_eks_internal_bool                = false
aws_lb_eks_load_balancer_type           = "application"
aws_lb_target_group_netflix_tg_name     = "netflix-target-group"
aws_lb_target_group_netflix_tg_port     = 30007
aws_lb_target_group_netflix_tg_protocol = "HTTP"
aws_lb_target_group_netflix_tg_health_check = {
  path                = "/"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}
aws_lb_listener_http_listener_netflix_port                = 30007
aws_lb_listener_http_listener_netflix_protocol            = "HTTP"
aws_lb_listener_http_listener_netflix_default_action_type = "forward"

# alb & target group - SonarQube
aws_lb_target_group_eks_tg_sonarqube_name     = "eks-target-group-sonarqube"
aws_lb_target_group_eks_tg_sonarqube_port     = 9000
aws_lb_target_group_eks_tg_sonarqube_protocol = "HTTP"
aws_lb_target_group_eks_tg_sonarqube_health_check = {
  path                = "/"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}
aws_lb_listener_http_listener_sonarqube_port                = 9000
aws_lb_listener_http_listener_sonarqube_protocol            = "HTTP"
aws_lb_listener_http_listener_sonarqube_default_action_type = "forward"

# alb & target group - Grafana
aws_lb_target_group_eks_tg_grafana_name     = "eks-target-group-grafana"
aws_lb_target_group_eks_tg_grafana_port     = 3000
aws_lb_target_group_eks_tg_grafana_protocol = "HTTP"
aws_lb_target_group_eks_tg_grafana_health_check = {
  path                = "/api/health"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}
aws_lb_listener_http_listener_grafana_port                = 3000
aws_lb_listener_http_listener_grafana_protocol            = "HTTP"
aws_lb_listener_http_listener_grafana_default_action_type = "forward"

# alb & target group - Prometheus
aws_lb_target_group_eks_tg_prometheus_name     = "eks-target-group-prometheus"
aws_lb_target_group_eks_tg_prometheus_port     = 9090
aws_lb_target_group_eks_tg_prometheus_protocol = "HTTP"
aws_lb_target_group_eks_tg_prometheus_health_check = {
  path                = "/status"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}

aws_lb_listener_http_listener_prometheus_port                = 9090
aws_lb_listener_http_listener_prometheus_protocol            = "HTTP"
aws_lb_listener_http_listener_prometheus_default_action_type = "forward"

# alb & target group - Node Exporter
aws_lb_target_group_eks_tg_node_exporter_name     = "eks-target-group-node-exporter"
aws_lb_target_group_eks_tg_node_exporter_port     = 9100
aws_lb_target_group_eks_tg_node_exporter_protocol = "HTTP"
aws_lb_target_group_eks_tg_node_exporter_health_check = {
  path                = "/"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}
aws_lb_listener_http_listener_node_exporter_port                = 9100
aws_lb_listener_http_listener_node_exporter_protocol            = "HTTP"
aws_lb_listener_http_listener_node_exporter_default_action_type = "forward"

# alb & target group - Argocd
aws_lb_argocd_name                  = "argocd"
aws_lb_argocd_internal_bool         = false
aws_lb_argocd_load_balancer_type    = "application"
aws_lb_target_group_argocd_name     = "argocd"
aws_lb_target_group_argocd_port     = 80
aws_lb_target_group_argocd_protocol = "HTTP"
aws_lb_target_group_argocd_health_check = {
  path                = "/"
  port                = "traffic-port"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200"
}
aws_lb_listener_http_listener_argocd_port                = 80
aws_lb_listener_http_listener_argocd_protocol            = "HTTP"
aws_lb_listener_http_listener_argocd_default_action_type = "forward"



# argocd credentials
null_resource_get_argocd_admin_password_remote_exec_inline = "sudo -u ubuntu /usr/bin/kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' -n argocd | base64 -d > /tmp/secrets"
# null_resource_get_argocd_admin_password_remote_exec_inline    = "sudo -u ubuntu /usr/bin/kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' -n argocd | base64 -d > /tmp/secrets.txt"
null_resource_get_argocd_admin_password_connection_type = "ssh"
null_resource_get_argocd_admin_password_connection_user = "ubuntu"
# null_resource_output_argocd_admin_password_remote_exec_inline = "sudo -u ubuntu /usr/bin/aws s3 cp /tmp/secrets_.txt s3://eks-netflix-argocd/secrets.txt"
# null_resource_output_argocd_admin_password_remote_exec_inline = "sudo -u ubuntu /usr/bin/aws s3 cp /tmp/secrets.txt s3://eks-netflix-argocd/secrets.txt"
null_resource_output_argocd_admin_password_connection_type = "ssh"
null_resource_output_argocd_admin_password_connection_user = "ubuntu"
# null_resource_yaml_to_s3_local_exec_command                = "sudo -u ubuntu aws s3 cp ../eks_alb/ingress.yaml s3://eks-netflix-argocd-ubuntu/ingress.yaml"
# null_resource_s3_to_instance_remote_exec_inline            = "sudo -u ubuntu aws s3 cp s3://eks-netflix-argocd-ubuntu/ingress.yaml /home/ubuntu/ingress.yaml"
# null_resource_ingress_alb_creation_remote_exec_inline      = "sudo -u ubuntu kubectl apply -f /home/ubuntu/ingress.yaml"
# null_resource_yaml_to_s3_connection_type                   = "ssh"
# null_resource_yaml_to_s3_connection_user                   = "ubuntu"
# null_resource_ingress_alb_creation_connection_type         = "ssh"
# null_resource_ingress_alb_creation_connection_user         = "ubuntu"

# "export ARGO_PWD=$(sudo -u ubuntu /usr/bin/kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)\""


# ssh -i "web-ec2.pem" ubuntu@10.0.12.15 'export ARGO_PWD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)'

aws_security_group_rule_argocd_port_type        = "ingress"
aws_security_group_rule_argocd_port_protocol    = "tcp"
aws_security_group_rule_argocd_port_cidr_blocks = ["10.0.0.0/16"]

# Port of Argocd
null_resource_get_argocd_port_remote_exec_inline    = "sudo -u ubuntu kubectl get svc argocd-server -n argocd -o jsonpath='{.spec.ports[?(@.port==80)].nodePort}' > /tmp/argocd_port_0.txt"
null_resource_get_argocd_port_connection_type       = "ssh"
null_resource_get_argocd_port_connection_user       = "ubuntu"
null_resource_output_argocd_port_connection_type    = "ssh"
null_resource_output_argocd_port_connection_user    = "ubuntu"
null_resource_output_argocd_port_remote_exec_inline = "sudo -u ubuntu /usr/bin/aws s3 cp /tmp/argocd_port_0.txt s3://eks-netflix-argocd-ubuntu/argocd_port_0.txt"
