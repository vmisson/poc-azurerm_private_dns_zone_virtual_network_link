resource "azurerm_virtual_network" "vnet1" {
  provider            = azurerm.Sub1
  name                = "vnet1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/24"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.0.0/24"
  }
}

resource "azurerm_virtual_network" "vnet2" {
  provider            = azurerm.Sub2
  name                = "vnet2"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
  address_space       = ["10.0.1.0/24"]

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.1.0/24"
  }
}