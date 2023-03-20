
#Define recovery services vault for landing zone
resource "azurerm_recovery_services_vault" "backup" {
  name                = "Hyperv-migration-backup-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
  sku                 = "Standard"
}


#Define recovery services vault for landing zone site recovery
resource "azurerm_recovery_services_vault" "asr" {
  name                = "Hyperv-migration-asr-teamgreen"
  location            = "UK West"
  resource_group_name = azurerm_resource_group.rgp.name
  sku                 = "Standard"
}

# Define storage account for landing zone
resource "azurerm_storage_account" "sa" {
  name                     = lower("Week5SATeamGreen")
  resource_group_name      = azurerm_resource_group.rgp.name
  location                 = azurerm_resource_group.rgp.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_log_analytics_workspace" "analytics" {
  name                = "Landingzone-analytics-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
