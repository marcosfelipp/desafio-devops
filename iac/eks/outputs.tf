output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}