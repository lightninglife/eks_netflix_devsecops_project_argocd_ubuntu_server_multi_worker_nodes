output "vpc_id" {
    value = aws_vpc.all.id
}

# Output the subnet IDs created by the aws_subnet resource
output "subnet_ids" {
  # alue = [for idx, subnet_id in aws_subnet.all[*].id : subnet_id if element(aws_subnet.all[*].availability_zone, idx) != element(aws_subnet.all[*].availability_zone, 0)]
  value = aws_subnet.private[*].id
}


# Output the subnet IDs created by the aws_subnet resource
output "subnet_id" {
  value = aws_subnet.private[0].id
}

# Output internet gateway
output "igw" {
  value = aws_internet_gateway.all.id
}

# Output cidr block
output "vpc_cidr_block" {
  value = aws_vpc.all.cidr_block
}

output "public_subnet" {
  value = aws_subnet.public[0].id
}