module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "MyEKS"
  cluster_version = "1.21"
  subnets         = module.vpc.public_subnets

  vpc_id = module.vpc.vpc_id

  # Managed Node Groups
  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 10
  }

  node_groups = {
    ng1 = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
