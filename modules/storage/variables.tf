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
variable "storage_account_name" {
  type        = string
  default     = "imagerecog1"
  description = "Storage account name"
  validation {
    condition     = length(var.storage_account_name) >= 3 && length(var.storage_account_name) <= 24
    error_message = "Storage account name must be between 3 and 24 characters long."
  }


} 
 variable "primary_connection_string" {
    description = "Primary connection string for the storage account"
    type        = string
    default     = ""
  }