terraform {
  backend "s3" {
    bucket = "route53-letscodebyada-apps-tf-state"
    key = "terraform.tfstate"
    region = "us-east-1"
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}


