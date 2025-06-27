output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.blobstorage.name
}
output "primary_connection_string" {
  description = "The primary connection string for the storage account"
  value       = azurerm_storage_account.blobstorage.primary_connection_string
  sensitive   = true
  
}
output "storage_account_access_key" {
  description = "The access key for the storage account"
  value       = azurerm_storage_account.blobstorage.primary_access_key
  sensitive   = true
}
