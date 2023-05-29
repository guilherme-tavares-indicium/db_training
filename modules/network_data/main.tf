
data "aws_default_tags" "project_data" {}

data "aws_subnets" "public" {
  tags = data.aws_default_tags.project_data.tags

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.main.ids[0]]
  }

  filter {
    name   = "tag:type"
    values = ["public"]
  }

}
data "aws_subnets" "private" {
  tags = data.aws_default_tags.project_data.tags
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.main.ids[0]]
  }

  filter {
    name   = "tag:type"
    values = ["private"]
  }
}
data "aws_vpcs" "main" {
  tags = data.aws_default_tags.project_data.tags
  filter {
    name   = "tag:tier"
    values = ["main"]
  }
}

data "aws_security_group" "main" {
  vpc_id = data.aws_vpcs.main.ids[0]
  tags = merge({
    "tier" = "main"
  }, data.aws_default_tags.project_data.tags)
}

