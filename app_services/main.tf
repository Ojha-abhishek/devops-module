resource "azurerm_service_plan" "appserviceplan" {
  for_each            = var.webapp
  name                = each.value.appserviceplanname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku_name            = "B3"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  for_each            = var.webapp
  name                = each.value.web_app_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  service_plan_id     = azurerm_service_plan.appserviceplan[each.key].id

  site_config {}
}