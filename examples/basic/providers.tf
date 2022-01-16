terraform {
    required_version = "= 1.1.0"

    required_providers {
      aws = {
          source = "hashicorp/aws"
      }
    }
}

provider "aws" {
  region = "ap-southeast-1"
}
