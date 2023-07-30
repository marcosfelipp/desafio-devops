module "eks" {

  source  = "registry.terraform.io/terraform-aws-modules/eks/aws"
  version = "19.4.2"

  cluster_name                   = local.cluster_name
  cluster_version                = "1.25"
  vpc_id                         = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids                     = data.terraform_remote_state.vpc.outputs.vpc_private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  aws_auth_users = local.aws_users


  eks_managed_node_groups = {
    instances1 = {
      subnet_ids                 = slice(data.terraform_remote_state.vpc.outputs.vpc_private_subnets, 0, 2)
      name                       = "node-group-apps"
      instance_types             = ["t3a.small"]
      min_size                   = 2
      max_size                   = 2
      desired_size               = 2
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


