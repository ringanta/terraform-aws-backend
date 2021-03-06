terraform {
  required_version = "= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
