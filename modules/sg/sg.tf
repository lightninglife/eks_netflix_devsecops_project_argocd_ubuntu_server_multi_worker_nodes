# Define a security group for HTTP/HTTPS access
resource "aws_security_group" "all" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  # Allow incoming HTTP (port 80) traffic
  ingress {
    from_port   = var.port_80
    to_port     = var.port_80
    protocol    = var.security_group_protocol
    cidr_blocks = [var.web_cidr]
  }

  # Allow incoming HTTPS (port 443) traffic
  ingress {
    from_port   = var.port_443
    to_port     = var.port_443
    protocol    = var.security_group_protocol
    cidr_blocks = [var.web_cidr]
  }

  # Allow SSH access for netflix (port 22)
  ingress {
    from_port   = var.port_22
    to_port     = var.port_22
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

  # Allow HTTP access for Grafana (port 3000)
  ingress {
    from_port   = var.port_3000
    to_port     = var.port_3000
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

  # # Allow HTTP access for Argocd Ingress (port 8080)
  # ingress {
  #   from_port   = var.port_8080
  #   to_port     = var.port_8080
  #   protocol    = var.security_group_protocol
  #   cidr_blocks = [var.web_cidr]
  #   self = true
  # }

  # # Allow HTTP access for Netflix (port 8081)
  # ingress {
  #   from_port   = var.port_8081
  #   to_port     = var.port_8081
  #   protocol    = var.security_group_protocol
  #   cidr_blocks = [var.web_cidr]
  # }


  # Allow HTTP access for SonarQube (port 9000)
  ingress {
    from_port   = var.port_9000
    to_port     = var.port_9000
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

  # Allow HTTP access for Prometheus (port 9090)
  ingress {
    from_port   = var.port_9090
    to_port     = var.port_9090
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

  # Allow HTTP access for Node Exporter (port 9100)
  ingress {
    from_port   = var.port_9100
    to_port     = var.port_9100
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

  # Allow HTTP access for Argocd (port 10250)
  ingress {
    from_port   = var.port_10250
    to_port     = var.port_10250
    protocol    = var.security_group_protocol
    cidr_blocks = [var.web_cidr]
  }

  # Allow HTTP access for Netflix (port 30007)
  ingress {
    from_port   = var.port_30007
    to_port     = var.port_30007
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_ip_address]
    self = true
  }

   # Allow HTTP access for Argocd Manifest (port 9443)
  ingress {
    from_port   = var.port_9443
    to_port     = var.port_9443
    protocol    = var.security_group_protocol
    cidr_blocks = [var.private_subnet]
  }

  # # Allow MySQL access for RDS (port 3306)
  # ingress {
  #   from_port   = var.port_3306
  #   to_port     = var.port_3306
  #   protocol    = var.security_group_protocol
  #   cidr_blocks = [var.private_ip_address]
  # }

  # Allow all outbound traffic
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"  # All protocols
    cidr_blocks     = ["0.0.0.0/0"]  # Allow traffic to all destinations
  }
}


# Define a security group for eks clusters
# Allow incoming HTTPS (port 443) traffic
resource "aws_security_group" "eks_cluster" { 
  name        = var.security_group_name_eks_cluster
  description = var.security_group_description_eks_cluster
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.port_443
    to_port     = var.port_443
    protocol    = var.security_group_protocol
    cidr_blocks = [var.vpc_cidr_block]
  }
  # Allow all outbound traffic
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"  # All protocols
    cidr_blocks     = ["0.0.0.0/0"]  # Allow traffic to all destinations
  }
}

# workder node to the bastion

# resource "aws_security_group_rule" "allow_ssh_from_bastion" {
#   type              = "ingress"
#   from_port         = var.port_22
#   to_port           = var.port_22
#   protocol          = var.security_group_protocol
#   security_group_id = aws_security_group.all.id
#   self = true
#   # source_security_group_id = aws_security_group.all.id
  
# }

# resource "null_resource" "force_rule_allow_ssh_from_bastion_update" {
#   triggers = {
#     always_run = timestamp()
#   }

#   depends_on = [aws_security_group_rule.allow_ssh_from_bastion]
# }