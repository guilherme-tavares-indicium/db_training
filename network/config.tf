locals {
  name                     = "main-vpc-${module.project_data.project_name}"
  cidr                     = "10.0.0.0/16"
  private_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets           = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                      = ["us-east-1a", "us-east-1b"]
  enable_nat_gateway       = true
  single_nat_gateway       = true
  enable_dns_hostnames     = true
  main_security_group_name = "main-sg-${module.project_data.project_name}"
  main_security_group_description = "Security group for services to talk to each other"
  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow all traffic to the IP that belongs to machine running terraform apply"
      cidr_blocks = format("%s/32", jsondecode(data.http.my_ip.response_body).ip)
    },
  ]
  ingress_with_self = [
    {
      rule = "all-all"
    },
  ]
  egress_with_self = [
    {
      rule = "all-all"
    },
  ]

  endpoints = {
    s3 = {
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    },
  }
  tags = local.sg_tags
  sg_description = "Main Security group for ${module.project_data.project_name}"
  

  vpc_tags = {
    "name" = local.name
    "tier" = "main"
  }
  provider_tags = {
    "vpc" = local.name
  }
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
    "type" : "public"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" : "1"
    "type" : "private"
  }
  sg_tags = {
    "tier" = "main"
  }
}