
# Define virtual network for the landing zone
resource "azurerm_virtual_network" "vnet" {
  name                = "Landing-zone-vnet-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
  address_space       = ["192.168.0.0/16"]
  dns_servers         = []

  tags = {
    environment = "Production"
  }  
}

# Define gateway subnet
resource "azurerm_subnet" "gateway" {
  name                 = "Landingzone-gwy-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.0.0/24"]
} 


# Define Azure Firewall subnet
resource "azurerm_subnet" "firewall" {
  name                 = "Landingzone-fwl-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.1.0/24"]
} 

# Define Domain Controller subnet
resource "azurerm_subnet" "dc" {
  name                 = "Landingzone-dc-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.2.0/24"]
}

# Define Smart Hotel WAF Controller subnet
resource "azurerm_subnet" "waf" {
  name                 = "Landingzone-waf-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.3.0/24"]
}

# Define Smart Hotel Web1 subnet
resource "azurerm_subnet" "web1" {
  name                 = "Landingzone-web1-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.4.0/24"]
}

# Define Smart Hotel Web2 subnet
resource "azurerm_subnet" "web2" {
  name                 = "Landingzone-web2-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.5.0/24"]
}

# Define Smart Hotel SQL subnet
resource "azurerm_subnet" "sql" {
  name                 = "Landingzone-sql-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.6.0/24"]
}

# Define Server 2003 subnet
resource "azurerm_subnet" "server" {
  name                 = "Landingzone-server-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.7.0/24"]
}

# Define Server 2003 subnet
resource "azurerm_subnet" "agw" {
  name                 = "Landingzone-agw-teamgreen"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.8.0/24"]
}
