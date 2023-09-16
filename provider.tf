terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}


provider "aws" {
  profile = var.profile
  region = var.aws_region
}