variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = "ImageRecog"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
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

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "ImageRecogPlan"
  
}
variable "function_app_name" {
  description = "Name of the Function App"
  type        = string
  default     = "ImageRecogFunctionApp" 
  
}