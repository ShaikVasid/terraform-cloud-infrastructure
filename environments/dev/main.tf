terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  name = "portfolio-dev"
  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "terraform-cloud-infrastructure"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "networking" {
  source                 = "../../modules/networking"
  name                   = local.name
  vpc_cidr               = "10.20.0.0/16"
  azs                    = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs   = ["10.20.1.0/24", "10.20.2.0/24"]
  private_subnet_cidrs  = ["10.20.11.0/24", "10.20.12.0/24"]
  tags                   = local.tags
}

module "security" {
  source = "../../modules/security"
  name   = local.name
  vpc_id = module.networking.vpc_id
  tags   = local.tags
}

module "iam" {
  source = "../../modules/iam"
  name   = local.name
  tags   = local.tags
}
