resource "azurerm_resource_group" "rg1" {
  provider = azurerm.Sub1
  name     = "rg-hub-1"
  location = "westeurope"
}

resource "azurerm_resource_group" "rg2" {
  provider = azurerm.Sub2
  name     = "rg-hub-2"
  location = "northeurope"
}
