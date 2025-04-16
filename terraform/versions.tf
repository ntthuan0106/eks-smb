terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}
