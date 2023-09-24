resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.database
  name                         = each.value.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

}

resource "azurerm_mssql_database" "sqldatabase" {
  for_each  = var.database
  name      = each.value.database_name
  server_id = azurerm_mssql_server.sqlserver[each.key].id
}