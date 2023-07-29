terraform {
  backend "s3" {
    bucket = "letscodebyada-app-provisioning-tf-state"
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

locals {
  cluster_name = "eks-apps"

  aws_users = [
    "arn:aws:iam:${var.aws_account_id}:user/*"
  ]

}


