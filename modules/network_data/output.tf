output "vpcs" {
  value = data.aws_vpcs.main
}

output "private_subnets" {
  value = data.aws_subnets.private
}
output "public_subnets" {
  value = data.aws_subnets.public
}

output "main_sg" {
  value = data.aws_security_group.main.id
}