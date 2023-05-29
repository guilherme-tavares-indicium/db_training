locals {
  name                    = "apps-db"
  identifier              = "${local.name}-${replace(module.project_data.project_name, "_", "-")}"
  db_password_secret_name = "${local.identifier}-password"
  engine                  = "postgres"
  engine_version          = var.engine_version
  major_engine_version    = split(".", var.engine_version)[0]       # DB option group
  family                  = "postgres${local.major_engine_version}" # DB parameter group
  instance_class          = var.instance_class
  allocated_storage       = 20
  max_allocated_storage   = 100
  db_name                 = replace(local.identifier, "-", "_")
  username                = "main_user"
  port                    = 5432
  publicly_accessible     = true
  multi_az                = true
  subnet_ids              = concat(module.network_data.public_subnets.ids)
  vpc_security_group_ids  = [module.security_group.security_group_id, module.network_data.main_sg]
  create_db_subnet_group  = true
  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false
  sg_name = "${local.name}-${replace(module.project_data.project_name, "_", "-")}"

}
