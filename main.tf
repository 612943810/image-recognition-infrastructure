# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ImageRecog" {
  name     = var.name
  location = var.location
}
module "storage" {
  source   = "./modules/storage"
  name     = var.name
  location = var.location
}
module "database" {
  source   = "./modules/database"
  name     = var.name
  location = var.location
  cosmosdb_account_name = var.cosmosdb_account_name
  databaseName = var.databaseName
  containerName = var.containerName
  throughput = var.throughput

}
module "functions" {
  source                        = "./modules/functions"
  name                          = azurerm_resource_group.ImageRecog.name
  location                      = azurerm_resource_group.ImageRecog.location
  primary_connection_string     = module.storage.primary_connection_string
  storage_account_name          = module.storage.storage_account_name
  storage_account_access_key    = module.storage.storage_account_access_key
  cosmosdb_connection_string    = module.database.cosmosdb_connection_string
}
