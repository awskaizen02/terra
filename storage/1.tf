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