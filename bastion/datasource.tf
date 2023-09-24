data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "Virtual_network_1"
  resource_group_name  = var.rgname
}

data "azurerm_public_ip" "public_ip" {
  name                = "shivampublicip01"
  resource_group_name = var.rgname
}