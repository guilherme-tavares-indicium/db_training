module "project_data" {
  source = "../modules/project_data"
}

module "network_data" {
  source = "../modules/network_data"
}

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}