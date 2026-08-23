variable "location" {
  description = "Azure region where the production environment is deployed."
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Resource group name for the production environment."
  type        = string
  default     = "rg-portfolio-prod"
}

variable "address_space" {
  description = "CIDR address space for the production virtual network."
  type        = string
  default     = "10.30.0.0/16"
}

variable "public_subnet_prefix" {
  description = "CIDR prefix for the production public subnet."
  type        = string
  default     = "10.30.1.0/24"
}

variable "private_subnet_prefix" {
  description = "CIDR prefix for the production private subnet."
  type        = string
  default     = "10.30.11.0/24"
}
