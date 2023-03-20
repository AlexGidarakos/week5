

# Define network security group for the landing zone
resource "azurerm_network_security_group" "nsg" {
  name                = "Landingzone-nsg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}


# Define DC application security group for the landing zone
resource "azurerm_application_security_group" "dc" {
  name                = "Landingzone-DCasg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}

# Define WAF application security group  for the landing zone
resource "azurerm_application_security_group" "waf" {
  name                = "Landingzone-WAFasg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}

# Define Web1 application security group  for the landing zone
resource "azurerm_application_security_group" "web1" {
  name                = "Landingzone-Web1asg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}

# Define Web2 application security group  for the landing zone
resource "azurerm_application_security_group" "web2" {
  name                = "Landingzone-Web2asg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}

# Define SQL application security group  for the landing zone
resource "azurerm_application_security_group" "sql" {
  name                = "Landingzone-SQLasg-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
}
