output "database_instance_name" {
  value = local.identifier
}

# Regex returns the host in string of format "host:port"
output "database_instance_endpoint" {
  value = split(":", data.aws_db_instance.main.endpoint)[0]
}

output "database_instance_port" {
  value = data.aws_db_instance.main.port
}

output "default_username" {
  value = data.aws_db_instance.main.master_username
}

output "default_password" {
  value = data.aws_secretsmanager_secret_version.password.secret_string
}