data "tls_certificate" "cluster" {
  url =  var.eks_netflix_url # aws_eks_cluster.cluster.identity.0.oidc.0.issuer

}

data "aws_caller_identity" "current" {}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

data "http" "lbc_iam_policy" {
  url = var.data_http_lbc_iam_policy_url # "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"

  # Optional request headers
  request_headers = {
    Accept = var.data_http_lbc_iam_policy_request_headers_accept # "application/json"
  }
}

data "aws_partition" "current" {}