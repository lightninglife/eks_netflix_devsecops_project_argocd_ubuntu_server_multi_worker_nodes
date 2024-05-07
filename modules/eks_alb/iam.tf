
# Resource: Create AWS Load Balancer Controller IAM Policy 
resource "aws_iam_policy" "lbc_iam_policy" {
  name        = var.aws_iam_policy_lbc_iam_policy_name # "${local.name}-AWSLoadBalancerControllerIAMPolicy"
  path        = var.aws_iam_policy_lbc_iam_policy_path # "/"
  description = var.aws_iam_policy_lbc_iam_policy_description # "AWS Load Balancer Controller IAM Policy"
  #policy = data.http.lbc_iam_policy.body
  policy = data.http.lbc_iam_policy.response_body
}

# IAM role for ALB Ingress Controller
resource "aws_iam_role" "lbc_iam_role" {
  name = "${local.name}-lbc-iam-role-netflix"

  # Terraform's "jsonencode" function converts a Terraform expression result to valid JSON syntax.
  assume_role_policy = var.aws_iam_role_lbc_iam_role_assume_role_policy

  tags = {
    tag-key = var.aws_iam_role_lbc_iam_role_tags # "AWSLoadBalancerControllerIAMPolicy"
  }
}

# Associate Load Balanacer Controller IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "lbc_iam_role_policy_attach" {
  policy_arn = aws_iam_policy.lbc_iam_policy.arn 
  role       = aws_iam_role.lbc_iam_role.name
}
