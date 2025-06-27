resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                      = var.cosmosdb_account_name
  location                  = var.location
  resource_group_name       = var.name
  offer_type                = "Standard"
  kind                      = "GlobalDocumentDB"
  automatic_failover_enabled = true
free_tier_enabled= true
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

}
resource "azurerm_cosmosdb_sql_database" "imageDatabase" {
  name                = var.databaseName
  resource_group_name = azurerm_cosmosdb_account.cosmos_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  throughput          = var.throughput
}
resource "azurerm_cosmosdb_sql_container" "image_container" {
  name                  = var.containerName
  resource_group_name   = azurerm_cosmosdb_account.cosmos_account.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmos_account.name
  database_name         = azurerm_cosmosdb_sql_database.imageDatabase.name
  partition_key_paths    = ["/definition/imageId"]
  partition_key_version = 1
  throughput            = var.throughput

  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }

    included_path {
      path = "/included/?"
    }

    excluded_path {
      path = "/excluded/?"
    }
  }

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}