# VPC variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

# Subnet variables
variable "public_subnet_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# variable "subnet" {
#   description = "Name of the subnet"
#   type        = string
# }


# Internet Gateway variables
variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
}

# Route Table variables
variable "rt_name" {
  description = "Name for the Route Table"
  type        = string
}

# Route Table Association variables
variable "rt_association" {
  description = "Name prefix for Route Table Association"
  type        = string
}

variable "web_cidr" {
  description = "Cidr block for web"
  type        = string
}

variable "availability_zones" {
  type    = list(string)
}

variable "aws_subnet_public_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "aws_subnet_public_eks_alb" {
  description = "Name of the public subnet associated with the EKS Application Load Balancer (ALB)"
  type        = string
}

variable "aws_subnet_public_eks_alb_value" {
  description = "Value of the public subnet associated with the EKS ALB"
  type        = number
}

variable "aws_subnet_private_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "aws_subnet_private_eks_alb" {
  description = "Name of the private subnet associated with the EKS Application Load Balancer (ALB)"
  type        = string
}

variable "aws_subnet_private_eks_alb_value" {
  description = "Value of the private subnet associated with the EKS ALB"
  type        = number
}
