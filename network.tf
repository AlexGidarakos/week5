
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
  name                 = "Gatewaysubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.0.0/24"]
}

# Define Azure Firewall subnet
resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.1.0/24"]
}

# Define Domain Controller subnet
resource "azurerm_subnet" "dc" {
  name                 = "domaincontrollersubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.2.0/24"]
}

# Define Smart Hotel WAF Controller subnet
resource "azurerm_subnet" "waf" {
  name                 = "smartHotelWAFSubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.3.0/24"]
}

# Define Smart Hotel Web1 subnet
resource "azurerm_subnet" "web1" {
  name                 = "smartHotelWeb1Subnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.4.0/24"]
}

# Define Smart Hotel Web2 subnet
resource "azurerm_subnet" "web2" {
  name                 = "smartHotelWeb2Subnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.5.0/24"]
}

# Define Smart Hotel SQL subnet
resource "azurerm_subnet" "sql" {
  name                 = "smartHotelSQLSubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.6.0/24"]
}

# Define Server 2003 subnet
resource "azurerm_subnet" "server" {
  name                 = "Server2003Subnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.7.0/24"]
}

# Define Server 2003 subnet
resource "azurerm_subnet" "agw" {
  name                 = "AppGwSubnet"
  resource_group_name  = azurerm_resource_group.rgp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.8.0/24"]
}
/*
# Define Public IP to be used for the VPN Gateway
resource "azurerm_public_ip" "vpn" {
  name                = "Landingzone-gw-pip-teamgreen"
  resource_group_name = azurerm_resource_group.rgp.name
  location            = azurerm_resource_group.rgp.location
  allocation_method   = "Static"
}

# Define VPN Gateway and helper resources
resource "azurerm_virtual_wan" "vpn" {
  name                = "Landingzone-vwan-teamgreen"
  resource_group_name = azurerm_resource_group.rgp.name
  location            = azurerm_resource_group.rgp.location
}

resource "azurerm_virtual_hub" "vpn" {
  name                = "Landingzone-hub-teamgreen"
  resource_group_name = azurerm_resource_group.rgp.name
  location            = azurerm_resource_group.rgp.location
  virtual_wan_id      = azurerm_virtual_wan.vpn.id
  address_prefix      = "192.168.0.0/24"
  sku = "Basic"
}

resource "azurerm_virtual_hub_ip" "vpn" {
  name           = "Landingzone-hub-ip-teamgreen"
  virtual_hub_id = azurerm_virtual_hub.vpn.id
  # private_ip_address           = "10.5.1.18"
  # private_ip_allocation_method = "Static"
  public_ip_address_id = azurerm_public_ip.vpn.id
  subnet_id            = azurerm_subnet.gateway.id
}

resource "azurerm_vpn_gateway" "example" {
  name                = "Landingzone-gw-teamgreen"
  location            = azurerm_resource_group.rgp.location
  resource_group_name = azurerm_resource_group.rgp.name
  virtual_hub_id      = azurerm_virtual_hub.vpn.id
}
*/
