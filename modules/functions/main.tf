resource "azurerm_service_plan" "image-recognition-app" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.name
   sku_name            = "FC1"
   os_type             = "Linux"
}

resource "azurerm_function_app_flex_consumption" "images-recognition-function-app" {
  name                = var.function_app_name
  resource_group_name = var.name
  location            = var.location


  storage_container_type         = "blobContainer"
  storage_container_endpoint     = var.primary_connection_string
  storage_authentication_type    = "StorageAccountConnectionString"
  storage_access_key = var.storage_account_access_key
  runtime_name                   = "python"
  runtime_version                = 3.12
  service_plan_id                = azurerm_service_plan.image-recognition-app.id

  site_config {
   
  }
}
