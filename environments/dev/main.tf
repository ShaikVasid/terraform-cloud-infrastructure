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

module "networking" {
  source                = "../../modules/networking"
  name                  = local.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  address_space         = "10.20.0.0/16"
  public_subnet_prefix  = "10.20.1.0/24"
  private_subnet_prefix = "10.20.11.0/24"
  tags                  = local.tags
}

module "security" {
  source              = "../../modules/security"
  name                = local.name
  resource_group_name = module.networking.resource_group_name
  location            = var.location
  tags                = local.tags
}

module "identity" {
  source              = "../../modules/iam"
  name                = local.name
  resource_group_id   = module.networking.resource_group_id
  tags                = local.tags
}
