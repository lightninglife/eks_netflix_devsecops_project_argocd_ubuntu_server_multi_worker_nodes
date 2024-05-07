# Netflix
resource "aws_autoscaling_attachment" "alb_attachment" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.netflix_tg.arn
}

# Step 1: Create an Application Load Balancer (ALB)
resource "aws_lb" "eks" {
  name               = var.aws_lb_eks_name # "eks-netflix"
  internal           = var.aws_lb_eks_internal_bool # false
  load_balancer_type = var.aws_lb_eks_load_balancer_type # "application"
  security_groups    = [var.security_group]
  subnets            = var.public_subnets
}

# Step 2: Create a Target Group
resource "aws_lb_target_group" "netflix_tg" {
  name     = var.aws_lb_target_group_netflix_tg_name # "netflix-target-group"
  port     = var.aws_lb_target_group_netflix_tg_port # 30007
  protocol = var.aws_lb_target_group_netflix_tg_protocol # "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    path                = var.aws_lb_target_group_netflix_tg_health_check["path"] # "/"
    port                = var.aws_lb_target_group_netflix_tg_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_netflix_tg_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_netflix_tg_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_netflix_tg_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_netflix_tg_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_netflix_tg_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_netflix_tg_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "netflix_alb_attachment" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.netflix_tg.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_netflix" {
  load_balancer_arn = aws_lb.eks.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_netflix_port # 30007                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_netflix_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_netflix_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.netflix_tg.arn
  }
}

# SonarQube
resource "aws_autoscaling_attachment" "alb_attachment_sonarqube" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.eks_tg_sonarqube.arn
}


# Step 2: Create a Target Group
resource "aws_lb_target_group" "eks_tg_sonarqube" {
  name     = var.aws_lb_target_group_eks_tg_sonarqube_name # "eks-target-group-sonarqube"
  port     = var.aws_lb_target_group_eks_tg_sonarqube_port # 9000
  protocol = var.aws_lb_target_group_eks_tg_sonarqube_protocol # "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.aws_lb_target_group_eks_tg_sonarqube_health_check["path"] # "/"
    port                = var.aws_lb_target_group_eks_tg_sonarqube_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_eks_tg_sonarqube_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_eks_tg_sonarqube_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_eks_tg_sonarqube_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_eks_tg_sonarqube_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_eks_tg_sonarqube_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_eks_tg_sonarqube_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "eks_alb_attachment_sonarqube" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.eks_tg_sonarqube.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_sonarqube" {
  load_balancer_arn = aws_lb.eks.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_sonarqube_port # 9000                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_sonarqube_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_sonarqube_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.eks_tg_sonarqube.arn
  }
}


# Grafana
resource "aws_autoscaling_attachment" "alb_attachment_grafana" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.eks_tg_grafana.arn
}


# Step 2: Create a Target Group
resource "aws_lb_target_group" "eks_tg_grafana" {
  name     = var.aws_lb_target_group_eks_tg_grafana_name # "eks-target-group-grafana"
  port     = var.aws_lb_target_group_eks_tg_grafana_port # 3000
  protocol = var.aws_lb_target_group_eks_tg_grafana_protocol # "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.aws_lb_target_group_eks_tg_grafana_health_check["path"] # "/api/health"
    port                = var.aws_lb_target_group_eks_tg_grafana_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_eks_tg_grafana_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_eks_tg_grafana_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_eks_tg_grafana_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_eks_tg_grafana_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_eks_tg_grafana_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_eks_tg_grafana_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "eks_alb_attachment_grafana" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.eks_tg_grafana.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_grafana" {
  load_balancer_arn = aws_lb.eks.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_grafana_port # 3000                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_grafana_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_grafana_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.eks_tg_grafana.arn
  }
}

# Prometheus
resource "aws_autoscaling_attachment" "alb_attachment_prometheus" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.eks_tg_prometheus.arn
}


# Step 2: Create a Target Group
resource "aws_lb_target_group" "eks_tg_prometheus" {
  name     = var.aws_lb_target_group_eks_tg_prometheus_name # "eks-target-group-prometheus"
  port     = var.aws_lb_target_group_eks_tg_prometheus_port # 9090
  protocol = var.aws_lb_target_group_eks_tg_prometheus_protocol # "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.aws_lb_target_group_eks_tg_prometheus_health_check["path"] # "/status"
    port                = var.aws_lb_target_group_eks_tg_prometheus_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_eks_tg_prometheus_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_eks_tg_prometheus_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_eks_tg_prometheus_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_eks_tg_prometheus_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_eks_tg_prometheus_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_eks_tg_prometheus_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "eks_alb_attachment_prometheus" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.eks_tg_prometheus.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_prometheus" {
  load_balancer_arn = aws_lb.eks.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_prometheus_port # 9090                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_prometheus_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_prometheus_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.eks_tg_prometheus.arn
  }
}


# Node Exporter
resource "aws_autoscaling_attachment" "alb_attachment_node_exporter" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.eks_tg_node_exporter.arn
}


# Step 2: Create a Target Group
resource "aws_lb_target_group" "eks_tg_node_exporter" {
  name     = var.aws_lb_target_group_eks_tg_node_exporter_name # "eks-target-group-node-exporter"
  port     = var.aws_lb_target_group_eks_tg_node_exporter_port # 9100
  protocol = var.aws_lb_target_group_eks_tg_node_exporter_protocol # "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = var.aws_lb_target_group_eks_tg_node_exporter_health_check["path"] # "/"
    port                = var.aws_lb_target_group_eks_tg_node_exporter_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_eks_tg_node_exporter_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_eks_tg_node_exporter_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_eks_tg_node_exporter_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_eks_tg_node_exporter_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_eks_tg_node_exporter_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_eks_tg_node_exporter_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "eks_alb_attachment_node_exporter" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.eks_tg_node_exporter.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_node_exporter" {
  load_balancer_arn = aws_lb.eks.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_node_exporter_port # 9100                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_node_exporter_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_node_exporter_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.eks_tg_node_exporter.arn
  }
}


# # Argocd (Ingress used to create alb)
# resource "aws_autoscaling_attachment" "alb_attachment_argocd" {
#   autoscaling_group_name = data.aws_autoscaling_groups.eks.names[0]
#   lb_target_group_arn   = data.aws_lb_target_group.argocd.arn

#   depends_on = [kubernetes_ingress_v1.argocd_ingress]
# }

# Step 1: Create an Application Load Balancer (ALB) - argocd
resource "aws_lb" "argocd" {
  name               = var.aws_lb_argocd_name # "argocd"
  internal           = var.aws_lb_argocd_internal_bool # false
  load_balancer_type = var.aws_lb_argocd_load_balancer_type # "application"
  security_groups    = [var.security_group]
  subnets            = var.public_subnets
}

# Step 2: Create a Target Group
resource "aws_lb_target_group" "argocd" {
  name     = var.aws_lb_target_group_argocd_name # "argocd"
  port     = data.aws_s3_object.argocd_port.body # randomly selected by eks
  protocol = var.aws_lb_target_group_argocd_protocol # "HTTP"
  # target_type = "ip"
  vpc_id   = var.vpc_id
  
  health_check {
    path                = var.aws_lb_target_group_argocd_health_check["path"] # "/"
    port                = var.aws_lb_target_group_argocd_health_check["port"] # "traffic-port"
    protocol            = var.aws_lb_target_group_argocd_health_check["protocol"] # "HTTP"
    interval            = var.aws_lb_target_group_argocd_health_check["interval"] # 30
    timeout             = var.aws_lb_target_group_argocd_health_check["timeout"] # 5
    healthy_threshold   = var.aws_lb_target_group_argocd_health_check["healthy_threshold"] # 2
    unhealthy_threshold = var.aws_lb_target_group_argocd_health_check["unhealthy_threshold"] # 2
    matcher             = var.aws_lb_target_group_argocd_health_check["matcher"] # "200"
  }

}

# Step 3: Attach the Target Group to the ALB
resource "aws_lb_target_group_attachment" "argocd_attachment" {
  # target_group_arn = aws_lb_target_group.eks_tg.arn
  # target_id        = var.eks_worker_node_id # You need to specify the target for your Target Group, adjust as needed

  count            = length(var.eks_worker_node_id) 
  target_group_arn = aws_lb_target_group.argocd.arn
  target_id        = var.eks_worker_node_id[count.index]
}

resource "aws_lb_listener" "http_listener_argocd" {
  load_balancer_arn = aws_lb.argocd.arn  # Specify the ARN of your ALB
  port              = var.aws_lb_listener_http_listener_argocd_port # 80                  # Specify the port for the HTTP listener
  protocol          = var.aws_lb_listener_http_listener_argocd_protocol # "HTTP"               # Specify the protocol (HTTP)
  
  default_action {
    type             = var.aws_lb_listener_http_listener_argocd_default_action_type # "forward"
    target_group_arn = aws_lb_target_group.argocd.arn
  }
}

# Argocd
resource "aws_autoscaling_attachment" "alb_attachment_argocd" {
  autoscaling_group_name = var.aws_autoscaling_attachment_alb_attachment_autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.argocd.arn
}
