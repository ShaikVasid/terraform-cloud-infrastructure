variable "name" { type = string }
variable "resource_group_id" { type = string }
variable "tags" { type = map(string) default = {} }

resource "azurerm_user_assigned_identity" "workload" {
  name                = "${var.name}-identity"
  location            = "Canada Central"
  resource_group_name = element(split("/", var.resource_group_id), 4)
  tags                = var.tags
}

resource "azurerm_role_assignment" "reader" {
  scope                = var.resource_group_id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.workload.principal_id
}
