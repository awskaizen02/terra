

resource "azurerm_resource_group" "demo" {
  name     = "hippo-rg"
  location = "eastus"
}


resource "azurerm_storage_account" "str" {
  name                     = "hippostagingd31"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.demo ]
}

resource "azurerm_storage_container" "sunday" {
  name                  = "sundaytest"
  storage_account_name  = azurerm_storage_account.str.name
  container_access_type = "blob"
  depends_on = [ azurerm_storage_account.str ]
}

resource "azurerm_storage_blob" "sample" {
  name                   = "provider.tf"
  storage_account_name   = azurerm_storage_account.str.name
  storage_container_name = azurerm_storage_container.sunday.name
  type                   = "Block"
  source                 = "provider.tf"
  depends_on = [ azurerm_storage_container.sunday ]
}
