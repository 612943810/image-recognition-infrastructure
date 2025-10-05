variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

variable "virtualNetworks_Vnet_Backend_Primary_name" {
  description = "Name for the Backend Virtual Network (VNet)."
  type        = string
  default     = "Vnet-Backend-Primary"
}