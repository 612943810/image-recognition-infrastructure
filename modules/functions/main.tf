resource "azurerm_app_service_plan" "image-recognition-app" {
  name                = var.app_service_plan_name
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

resource "azurerm_linux_function_app" "images-recognition-function-app" {
  name                = var.function_app_name
  resource_group_name = var.name
  location            = var.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = azurerm_app_service_plan.image-recognition-app.id

  site_config {
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "Python"
    "AzureWebJobsStorage"         = var.primary_connection_string
    "CosmosDBConnectionString"    = var.cosmosdb_connection_string
  }
}