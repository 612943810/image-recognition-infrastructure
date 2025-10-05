resource "azurerm_virtual_network" "vnet_backend" {
  name                = var.virtualNetworks_Vnet_Backend_Primary_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.3.0.0/16"]

  tags = {
    Site = "Primary"
  }
}

resource "azurerm_subnet" "storage" {
  name                 = "storage"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet_backend.name
  address_prefixes     = ["10.3.1.0/24"]

  service_endpoints    = ["Microsoft.Storage"] 
}

resource "azurerm_subnet" "function" {
  name                 = "function"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.vnet_backend.name
  address_prefixes     = ["10.3.2.0/24"]

  service_endpoints = [
    "Microsoft.AzureCosmosDB",
    "Microsoft.CognitiveServices",
    "Microsoft.Storage",
  ]

  delegation {
    name = "Microsoft.Web/serverfarms"
    service_delegation {
      name = "Microsoft.Web/serverfarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}