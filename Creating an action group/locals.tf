locals {
  resource_group_name="app-grp"
  location="eastus"
  virtual_network={
    name="app-network"
    address_space="10.0.0.0/16"
  }

}
