data "azurerm_virtual_network" "vnet" {
  for_each            = var.peering
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}