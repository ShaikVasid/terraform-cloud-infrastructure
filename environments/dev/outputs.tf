output "vpc_id" { value = module.networking.vpc_id }
output "public_subnet_ids" { value = module.networking.public_subnet_ids }
output "private_subnet_ids" { value = module.networking.private_subnet_ids }
output "application_security_group_id" { value = module.security.security_group_id }
output "ec2_role_name" { value = module.iam.role_name }
