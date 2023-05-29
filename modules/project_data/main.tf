locals {
  path_before_modules_project_data = element(split("/modules/project_data", "${path.module}"), 0)
  project_data_json_path           = "${local.path_before_modules_project_data}/project_config.json"
  project_config                   = jsondecode(file(local.project_data_json_path))
  region                           = local.project_config.region
  project_name                     = local.project_config.project_name
  project_name_hyphen              = replace(local.project_name, "_", "-")
  profile                          = local.project_config.profile
}
