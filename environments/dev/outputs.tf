output "resource_group_id" { value = module.networking.resource_group_id }
output "resource_group_name" { value = module.networking.resource_group_name }
output "vnet_id" { value = module.networking.vnet_id }
output "public_subnet_id" { value = module.networking.public_subnet_id }
output "private_subnet_id" { value = module.networking.private_subnet_id }
output "network_security_group_id" { value = module.security.network_security_group_id }
output "managed_identity_principal_id" { value = module.identity.principal_id }
