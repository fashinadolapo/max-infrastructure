terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}


provider "aws" {
  profile    = "default"
  #region     = var.region
  token      = var.token
}
