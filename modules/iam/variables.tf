variable "name" {
  description = "Base name used for identity resources."
  type        = string
}

variable "location" {
  description = "Azure region where the managed identity is deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the managed identity."
  type        = string
}

variable "resource_group_id" {
  description = "Resource ID of the resource group receiving the RBAC assignment."
  type        = string
}

variable "tags" {
  description = "Tags applied to identity resources."
  type        = map(string)
  default     = {}
}
