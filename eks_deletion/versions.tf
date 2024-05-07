terraform {
  required_version = "~>1.7"

  required_providers {
    aws = {
      version = "<= 5.38"
    }
  }
  # You can specify additional required providers here.
}
