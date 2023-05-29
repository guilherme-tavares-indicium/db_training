<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_data"></a> [project\_data](#module\_project\_data) | ../project_data | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_instance) | data source |
| [aws_default_tags.project_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |
| [aws_secretsmanager_secret.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_instance_endpoint"></a> [database\_instance\_endpoint](#output\_database\_instance\_endpoint) | Regex returns the host in string of format "host:port" |
| <a name="output_database_instance_name"></a> [database\_instance\_name](#output\_database\_instance\_name) | n/a |
| <a name="output_database_instance_port"></a> [database\_instance\_port](#output\_database\_instance\_port) | n/a |
| <a name="output_default_password"></a> [default\_password](#output\_default\_password) | n/a |
| <a name="output_default_username"></a> [default\_username](#output\_default\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
