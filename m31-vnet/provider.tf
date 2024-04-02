terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
    subscription_id = ""
    tenant_id = ""
    client_id = ""
    client_secret = ""
  features {
    
  }
}