# Define Local Values in Terraform
locals {
  owners = "eks"
  environment = "netflix"
  name = "netflix"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 