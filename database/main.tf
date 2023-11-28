module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.6.0"

  identifier              = local.identifier
  engine                  = local.engine
  engine_version          = local.engine_version
  family                  = local.family
  major_engine_version    = local.major_engine_version
  instance_class          = local.instance_class
  allocated_storage       = local.allocated_storage
  max_allocated_storage   = local.max_allocated_storage
  publicly_accessible     = local.publicly_accessible
  multi_az                = local.multi_az
  subnet_ids              = local.subnet_ids
  vpc_security_group_ids  = local.vpc_security_group_ids
  create_db_subnet_group  = local.create_db_subnet_group
  backup_retention_period = local.backup_retention_period
  skip_final_snapshot     = local.skip_final_snapshot
  deletion_protection     = local.deletion_protection
  db_name                 = local.db_name
  username                = local.username
  port                    = local.port
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = local.sg_name
  description = "Security group for ${local.identifier}"
  vpc_id      = module.network_data.vpcs.ids[0]

  ingress_with_source_security_group_id = [
    {
      rule                     = "postgresql-tcp"
      source_security_group_id = module.network_data.main_sg
    }
  ]

  egress_with_cidr_blocks = [
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"

  }]

  ingress_with_cidr_blocks = [
    {
      from_port   = local.port
      to_port     = local.port
      protocol    = "tcp"
      description = "PostgreSQL access from the internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}
resource "aws_secretsmanager_secret" "db_password" {
  name                    = local.db_password_secret_name
  recovery_window_in_days = 0
}
resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = module.db.db_instance_password
}
