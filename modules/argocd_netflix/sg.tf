resource "aws_security_group_rule" "argocd_8080" {
  type              = var.aws_security_group_rule_8080_type # "ingress"
  from_port         = var.aws_security_group_rule_8080_from_port # 8080
  to_port           = var.aws_security_group_rule_8080_to_port # 8080
  protocol          = var.aws_security_group_rule_8080_protocol # "tcp"
  cidr_blocks       = var.aws_security_group_rule_8080_cidr_blocks # ["10.0.0.0/16"]  # Allow traffic from this CIDR block
  security_group_id = data.aws_security_groups.all.ids[0]
}
