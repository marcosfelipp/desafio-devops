terraform {
  backend "s3" {
    bucket = "letscodebyada-rds-provisioning-tf-state"
    key = "terraform.tfstate"
    region = "us-east-1"
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}