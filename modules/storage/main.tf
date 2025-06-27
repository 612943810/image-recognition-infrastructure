resource "azurerm_storage_account" "blobstorage" {
  name = var.storage_account_name
  resource_group_name = var.name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

}
