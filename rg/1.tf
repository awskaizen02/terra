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

  resource "azurerm_resource_group" "hippo-rg" {
  name     = "hippo-rg"
  location = "eastus"
}