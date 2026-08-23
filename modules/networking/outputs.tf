output "vnet_id" {
  description = "Resource ID of the Azure virtual network."
  value       = azurerm_virtual_network.this.id
}

output "public_subnet_id" {
  description = "Resource ID of the public subnet."
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "Resource ID of the private subnet."
  value       = azurerm_subnet.private.id
}
