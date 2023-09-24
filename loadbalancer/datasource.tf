data "azurerm_public_ip" "public_ip" {
  for_each            = var.vm
  name                = "PublicIPForLB"
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  for_each            = var.vm
  name                = "Virtual_network_1"
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_machine" "virtualmachine" {
  for_each            = var.vm
  name                = each.value.name
  resource_group_name = each.value.re
}