resource "azurerm_resource_group" "demo" {
  name     = "demo-resources"
  location = "eastus"
}

resource "azurerm_network_security_group" "d-sg" {
  name                = "demo-security-group"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_virtual_network" "d-vn" {
  name                = "demo-network"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.0.0.0/16"]


  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  
  }

  
}