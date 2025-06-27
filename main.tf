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