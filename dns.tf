variable "private_dns_zones" {
  type    = list(string)
  default = ["privatelink.blob.core.windows.net", "privatelink.table.core.windows.net", "privatelink.adf.azure.com"]

}

variable "virtual_networks" {
  type = list(string)
  default = [
    "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-hub-1/providers/Microsoft.Network/virtualNetworks/vnet1",
    "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rg-hub-2/providers/Microsoft.Network/virtualNetworks/vnet2"
  ]
}

module "dns-vnet-link" {
  for_each = toset(var.private_dns_zones)
  source   = "./modules/dns_zone_virtual_network_link"

  resource_group_name   = "private-dns-zones-rg"
  private_dns_zone_name = each.value
  virtual_network_ids   = var.virtual_networks

  # Create the DNS VNet Link after the VNet has been created
  depends_on = [azurerm_virtual_network.vnet1, azurerm_virtual_network.vnet2]
}