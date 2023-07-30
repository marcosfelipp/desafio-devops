data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "letscodebyada-net-provisioning-tf-state"
    key     = "terraform.tfstate"
    region  = "us-east-1"
  }
}