module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"
  name                 = local.name
  cidr                 = local.cidr
  azs                  = local.azs
  private_subnets      = local.private_subnets
  public_subnets       = local.public_subnets
  enable_nat_gateway   = local.enable_nat_gateway
  single_nat_gateway   = local.single_nat_gateway
  enable_dns_hostnames = local.enable_dns_hostnames
  public_subnet_tags   = local.public_subnet_tags
  private_subnet_tags  = local.private_subnet_tags
  vpc_tags             = local.vpc_tags
  map_public_ip_on_launch = true
}

module "main_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"
  name        = local.main_security_group_name
  description = local.sg_description
  vpc_id      = module.vpc.vpc_id
  ingress_with_cidr_blocks = local.ingress_with_cidr_blocks
  ingress_with_self = local.ingress_with_self
  egress_with_self = local.egress_with_self
  tags = local.sg_tags
}