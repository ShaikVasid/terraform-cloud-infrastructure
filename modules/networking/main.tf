variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "address_space" { type = string }
variable "public_subnet_prefix" { type = string }
variable "private_subnet_prefix" { type = string }
variable "tags" { type = map(string) default = {} }

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "this" {
  name                = "${var.name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = [var.address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "public" {
  name                 = "${var.name}-public"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.public_subnet_prefix]
}

resource "azurerm_subnet" "private" {
  name                 = "${var.name}-private"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.private_subnet_prefix]
}
