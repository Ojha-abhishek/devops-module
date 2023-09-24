resource "azurerm_storage_account" "storageaccount" {
  for_each                 = var.sa
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_storage_container" "container" {
  for_each              = var.sa
  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.storageaccount[each.key].name
  container_access_type = each.value.container_access_type
}