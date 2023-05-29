<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_bitbucket"></a> [bitbucket](#requirement\_bitbucket) | >= 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_bitbucket"></a> [bitbucket](#provider\_bitbucket) | >= 1.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_main_security_group"></a> [main\_security\_group](#module\_main\_security\_group) | terraform-aws-modules/security-group/aws | 4.17.1 |
| <a name="module_project_data"></a> [project\_data](#module\_project\_data) | ../../modules/project_data | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.19.0 |

## Resources

| Name | Type |
|------|------|
| [bitbucket_ip_ranges.pipeline_ranges](https://registry.terraform.io/providers/DrFaust92/bitbucket/latest/docs/data-sources/ip_ranges) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
