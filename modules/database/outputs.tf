output "cosmosdb_connection_string" {
  description = "The primary connection string for the Cosmos DB account"
  value       = azurerm_cosmosdb_account.imageDatabase.primary_sql_connection_string
  sensitive   = true
}