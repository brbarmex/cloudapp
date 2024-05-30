terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.45.0"
    }
  }

  required_version = ">=1.5.7"
}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = local.tags
  }
}