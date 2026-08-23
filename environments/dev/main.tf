terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}

  resource_provider_registrations = "core"
}

locals {
  name = "portfolio-dev"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "terraform-cloud-infrastructure"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

module "networking" {
  source = "../../modules/networking"

  name                = local.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.address_space
  public_subnet_prefix  = var.public_subnet_prefix
  private_subnet_prefix = var.private_subnet_prefix
  tags                = local.tags
}

module "security" {
  source = "../../modules/security"

  name                = local.name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  tags                = local.tags
}

module "identity" {
  source = "../../modules/iam"

  name                = local.name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  resource_group_id   = azurerm_resource_group.this.id
  tags                = local.tags
}

output "resource_group_name" {
  description = "Name of the environment resource group."
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "Resource ID of the environment virtual network."
  value       = module.networking.vnet_id
}

output "private_subnet_id" {
  description = "Resource ID of the private subnet."
  value       = module.networking.private_subnet_id
}

output "identity_principal_id" {
  description = "Principal ID of the workload managed identity."
  value       = module.identity.principal_id
}
