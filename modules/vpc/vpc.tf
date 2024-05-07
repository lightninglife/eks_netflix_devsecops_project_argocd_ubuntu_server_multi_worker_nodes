resource "aws_vpc" "all" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.all.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.aws_subnet_public_name # "public_subnets"
    "${var.aws_subnet_public_eks_alb}" = var.aws_subnet_public_eks_alb_value # "kubernetes.io/role/elb" = 1
  }

}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.all.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = var.aws_subnet_private_name # "private_subnets"
    "${var.aws_subnet_private_eks_alb}" = var.aws_subnet_private_eks_alb_value # "kubernetes.io/role/internal-elb" = 1
  }
}


resource "aws_internet_gateway" "all" {
  vpc_id = aws_vpc.all.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_nat_gateway" "all" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

}

resource "aws_eip" "nat" {
  count = length(var.availability_zones)
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.all.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.all.id
  }

}

resource "aws_route_table" "private" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.all.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.all[count.index].id
  }

}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

# # Define a null_resource to handle the deletion of the VPC
# resource "null_resource" "delete_vpc" {
#   # This local-exec provisioner will execute a command after the VPC is destroyed
#   triggers = {
#     vpc_id = aws_vpc.all.id
#   }

#   # This local-exec provisioner will execute a command after the VPC is destroyed
#   provisioner "local-exec" {
#     command = <<EOF
# aws ec2 delete-vpc --vpc-id ${self.triggers.vpc_id}
# EOF
#     # Specify that this provisioner should run only when the null_resource is destroyed
#     when = destroy
#   }
# }
