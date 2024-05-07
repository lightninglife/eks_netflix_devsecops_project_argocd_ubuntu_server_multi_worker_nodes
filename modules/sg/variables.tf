variable "security_group_name" {
  description = "Name of the AWS security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the AWS security group"
  type        = string
}

variable "security_group_name_eks_cluster" {
  description = "Name of the AWS security group for eks cluster"
  type        = string
}

variable "security_group_description_eks_cluster" {
  description = "Description of the AWS security group for eks cluster"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "port_80" {
  description = "Port for HTTP traffic (e.g., 80)"
  type        = number
}

variable "port_443" {
  description = "Port for HTTPS traffic (e.g., 443)"
  type        = number
}

variable "port_22" {
  description = "Port for SSH access (e.g., 22)"
  type        = number
}

variable "port_3000" {
  description = "Port for HTTP access for Grafana (e.g., 3000)"
  type        = number
}


# variable "port_8080" {
#   description = "Port for HTTP access for Jenkins (e.g., 8080)"
#   type        = number
# }

variable "port_10250" {
  description = "Port for HTTP access for Argocd (e.g., 10250)"
  type        = number
}

variable "port_30007" {
  description = "Port for HTTP access for Netflix (e.g., 30007)"
  type        = number
}

# variable "port_8081" {
#   description = "Port for HTTP access for Netflix (e.g., 8081)"
#   type        = number
# }

variable "port_9000" {
  description = "Port for HTTP access for Netflix (e.g., 9000)"
  type        = number
}

variable "port_9090" {
  description = "Port for HTTP access for Prometheus (e.g., 9090)"
  type        = number
}

variable "port_9100" {
  description = "Port for HTTP access for Node Exporter (e.g., 9100)"
  type        = number
}

variable "port_9443" {
  description = "Port for HTTP access for Argocd Manifest (e.g., 9443)"
  type        = number
}

variable "port_3306" {
  description = "Port for MySQL access for RDS (e.g., 3306)"
  type        = number
}

variable "security_group_protocol" {
  description = "Protocol for the security group rules (e.g., 'tcp', 'udp', 'icmp', etc.)"
  type        = string
}

variable "web_cidr" {
  description = "CIDR block for incoming HTTP and HTTPS traffic"
  type        = string
}

variable "private_ip_address" {
  description = "CIDR block for private IP addresses (e.g., for SSH, Jenkins, MySQL)"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet" {
  description = "10.0.0.0/16 private subnet"
  type = string
}