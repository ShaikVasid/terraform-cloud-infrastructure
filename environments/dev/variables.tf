variable "location" {
  description = "Azure region for the environment"
  type        = string
  default     = "Canada Central"
}

variable "resource_group_name" {
  description = "Resource group for the environment"
  type        = string
  default     = "rg-portfolio-dev"
}
