module "project_data" {
  source = "../modules/project_data"
}

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}