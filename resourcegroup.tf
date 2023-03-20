
# Define resource group for the landing zone
resource "azurerm_resource_group" "rgp" {
  name     = "Landingzone-rg-teamgreen"
  location = "UK South"
}