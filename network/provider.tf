terraform {
  required_version = ">=1.2"
  # backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }
  }
}

provider "aws" {
  profile = module.project_data.project_profile
  region  = module.project_data.region
  default_tags {
    tags = {
      "project": "lighthouse"
    }
  }
}