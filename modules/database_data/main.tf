locals {
  name        = "apps-db"
  identifier  = "${local.name}-${replace(module.project_data.project_name, "_", "-")}"
  secret_name = "${local.identifier}-password"
}
data "aws_default_tags" "project_data" {}

data "aws_db_instance" "main" {
  db_instance_identifier = local.identifier
  tags                   = data.aws_default_tags.project_data.tags
}

data "aws_secretsmanager_secret" "password" {
  name = local.secret_name

}
data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.password.id
}