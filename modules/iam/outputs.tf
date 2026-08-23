output "identity_id" {
  description = "Resource ID of the workload managed identity."
  value       = azurerm_user_assigned_identity.workload.id
}

output "principal_id" {
  description = "Principal ID of the workload managed identity."
  value       = azurerm_user_assigned_identity.workload.principal_id
}

output "client_id" {
  description = "Client ID of the workload managed identity."
  value       = azurerm_user_assigned_identity.workload.client_id
}
