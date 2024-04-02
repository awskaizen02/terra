terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.97.1"
      }
    }
  }
  
  provider "azurerm" {
    subscription_id = ""
    tenant_id = ""
    client_id = ""
    client_secret = ""
    features {
      
    }

  }

  resource "azurerm_resource_group" "hippo" {
  name     = "hippo-rg1"
  location = "eastus"
}

resource "azurerm_storage_account" "hippostrm31" {
  name                     = "hippostrm31"
  resource_group_name      = azurerm_resource_group.hippo.name
  location                 = azurerm_resource_group.hippo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  

  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "hippostrm31"
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "maintf" {
  name                   = "1.tf"
  storage_account_name   = "hippostrm31"
  storage_container_name = "data"
  type                   = "Block"
  source                 = "main.tf"
}