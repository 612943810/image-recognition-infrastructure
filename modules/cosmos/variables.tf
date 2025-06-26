variable "prefix" {
  type        = string
  default     = "cosmos-db-free-tier"
  description = "Prefix of the resource name"
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Resource group location"
}

variable "cosmosdb_account_name" {
  type        = string
  default     = "personal"
  description = "Cosmos db account name"
  validation {
    condition     = length(var.cosmosdb_account_name) >= 3 && length(var.cosmosdb_account_name) <= 50
    error_message = "Cosmos db account name must be between 3 and 50 characters long."
  }
  
}
variable "throughput" {
  type        = number
  default     = 400
  description = "Cosmos db database throughput"
  validation {
    condition     = var.throughput >= 400 && var.throughput <= 1000000
    error_message = "Cosmos db manual throughput should be equal to or greater than 400 and less than or equal to 1000000."
  }
  validation {
    condition     = var.throughput % 100 == 0
    error_message = "Cosmos db throughput should be in increments of 100."
  }
}
variable "databaseName" {
  type        = string
  default     = "imagerecognition"
  description = "Name of the Cosmos DB SQL database"
}

variable "containerName" {
  type        = string
  default     = "images"
  description = "Name of the Cosmos DB SQL database"
}
variable "name" {
  description = "The name of the resource group"
  type        = string
  default     = "ImageRecog"
}

