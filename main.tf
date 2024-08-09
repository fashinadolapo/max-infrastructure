module "vpc" {
  source                        = "terraform-aws-modules/vpc/aws"
  version                       = "3.4.0"
  name                          = var.vpc_name
  cidr                          = var.vpc_cidr
  azs                           = [var.availability-zone-a, var.availability-zone-b, var.availability-zone-c]
  private_subnets               = [var.private_subnets-a, var.private_subnets-b, var.private_subnets-c]
  public_subnets                = [var.public_subnets-a, var.public_subnets-b, var.public_subnets-c]
  enable_nat_gateway            = true
  single_nat_gateway            = true
  enable_dns_hostnames          = true
  manage_default_security_group = true
  default_security_group_name   = var.security_group
  
  public_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }

  tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
  }

}

module "eks-cluster" {
  source                        = "terraform-aws-modules/eks/aws"
  version                       = "17.1.0"
  cluster_name                  = var.cluster_name
  cluster_version               = "1.21"
  subnets                       = flatten([module.vpc.outputs.public_subnets, module.vpc.outputs.private_subnets])
  cluster_delete_timeout        = "30m"
  cluster_iam_role_name         = var.cluster-iam-name
  cluster_enabled_log_types     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cluster_log_retention_in_days = 7

 vpc_id = module.vpc.outputs.vpc_id

  fargate_pod_execution_role_name = var.fargate_role_name
  
fargate_profiles = {
    coredns-fargate-profile = {
      name = "coredns"
      selectors = [
        {
          namespace = "kube-system"
          labels = {
            k8s-app = "kube-dns"
          }
        },
        {
          namespace = var.namespace
        }
      ]
      subnets = flatten([module.vpc.outputs.private_subnets])
    }
  }

}

resource "aws_eks_addon" "coredns" {
  addon_name        = "coredns"
  addon_version     = "v1.8.4-eksbuild.1"
  cluster_name      = "eks-serve"
  resolve_conflicts = "OVERWRITE"
  depends_on        = [module.eks-cluster]
}








