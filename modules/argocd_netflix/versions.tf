terraform {
  required_version = "~>1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.38"
    }

    argocd = {
      source = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

# Note: Replace the version constraints with those appropriate for your project.
