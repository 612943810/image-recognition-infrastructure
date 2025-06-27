resource "azurerm_app_service_plan" "image-recognition-app" {
  name                = "image-recognition-app"
  location            = var.location
  resource_group_name = var.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  lifecycle {
    ignore_changes = [
      kind
    ]
  }
}

resource "azurerm_linux_function_app" "example" {
  name                = "image-recognition-function-app"
  resource_group_name = var.name
  location            = var.location

  storage_account_name       = module.storage.storage_account_name
  storage_account_access_key = module.storage.storage_account_access_key
  service_plan_id            = azurerm_service_plan.image-recognition-app.id

  site_config {
    linux_fx_version = "DOCKER|mcr.microsoft.com/azure-functions/python:4-python3.10"
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "Python"
    "AzureWebJobsStorage"         = var.primary_connection_string
    "CosmosDBConnectionString"    = var.cosmosdb_connection_string
  }
}