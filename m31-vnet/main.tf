
locals {
  resource_group_name="app-grp"
  location="eastus"
  virtual_network={
    name="app-network"
    address_space="192.168.0.0/24"
  }

  subnets=[
    {
      name="subnetA"
      address_prefix="192.168.0.0/28"
    },
    {
      name="subnetB"
      address_prefix="192.168.0.16/28"
    }
  ]
}



resource "azurerm_resource_group" "demo" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_network_security_group" "demosg" {
  name                = "demo-sg"
  location            = local.location
  resource_group_name = local.resource_group_name
}

resource "azurerm_virtual_network" "app-network" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]
  

  subnet {
    name           = local.subnets[0].name
    address_prefix = local.subnets[0].address_prefix
  }

  subnet {
    name           = local.subnets[1].name
    address_prefix = local.subnets[1].name
    
  }

  tags = {
    environment = "dev"
  }
}