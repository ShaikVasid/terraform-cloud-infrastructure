variable "location" {
  description = "Azure region where the environment is deployed."
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Resource group name for the environment."
  type        = string
  default     = "rg-portfolio-dev"
}

variable "address_space" {
  description = "CIDR address space for the Azure virtual network."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_prefix" {
  description = "CIDR prefix for the public subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_subnet_prefix" {
  description = "CIDR prefix for the private subnet."
  type        = string
  default     = "10.20.11.0/24"
}
