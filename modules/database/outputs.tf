output "cosmosdb_connection_string" {
  description = "The primary connection string for the Cosmos DB account"
  value       = "${azurerm_cosmosdb_account.cosmos_account.endpoint};AccountKey=${azurerm_cosmosdb_account.cosmos_account.primary_key};"
  sensitive   = true
}