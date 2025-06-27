variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = "ImageRecog"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "eastus2"
}
 variable "cosmosdb_connection_string" {
  description = "Cosmos DB connection string"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
}

variable "storage_account_access_key" {
  description = "Storage account access key"
  type        = string
}
variable "primary_connection_string" {
  description = "Primary connection string for the storage account"
  type        = string
}