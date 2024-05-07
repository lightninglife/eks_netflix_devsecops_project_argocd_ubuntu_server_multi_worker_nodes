terraform {
  required_version = "~>1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.0"
    }
    # You can specify additional required providers here.
  }
}