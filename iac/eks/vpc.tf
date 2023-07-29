data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  cidr = "10.100.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  name             = "${local.cluster_name}-vpc"
  public_subnets   = ["10.100.0.0/24", "10.100.1.0/24"]
  private_subnets  = ["10.100.10.0/24", "10.100.11.0/24"]

  create_database_subnet_group = false
  enable_nat_gateway           = true
  single_nat_gateway           = true
  enable_dns_hostnames         = true
}