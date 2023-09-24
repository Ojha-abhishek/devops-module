data "azurerm_public_ip" "public_ip" {
  name                = "PublicIPForLB"
  resource_group_name = var.rgname
}

data "azurerm_virtual_network" "vnet" {
  name                = "Virtual_network_1"
  resource_group_name = var.rgname
}

data "azurerm_virtual_machine" "virtualmachine" {
  for_each            = var.vm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}