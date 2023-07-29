module "eks" {

  source  = "registry.terraform.io/terraform-aws-modules/eks/aws"
  version = "19.4.2"

  cluster_name                   = local.cluster_name
  cluster_version                = "1.25"
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  aws_auth_users = local.aws_users


  eks_managed_node_groups = {
    instances1 = {
      subnet_ids                 = slice(module.vpc.private_subnets, 0, 1)
      name                       = "node-group-apps"
      instance_types             = ["t3.micro"]
      min_size                   = 2
      max_size                   = 4
      desired_size               = 3
      disk_size                  = 20
      use_custom_launch_template = false
    }
  }

  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      type        = "ingress"
      self        = true
    }
  }
}


