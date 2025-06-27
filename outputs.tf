output "cosmosdb_connection_string" {
  description = "The primary connection string for the Cosmos DB account"
  value       = module.database.cosmosdb_connection_string
  sensitive   = true
  
}
output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}
output "primary_connection_string" {
  description = "The primary connection string for the storage account"
  value       = module.storage.primary_connection_string
  sensitive   = true
}
output "storage_account_access_key" {
  description = "The access key for the storage account"
  value       = module.storage.storage_account_access_key
  sensitive   = true

}