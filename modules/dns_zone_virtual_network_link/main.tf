resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each              = toset(var.virtual_network_ids)
  name                  = "${element(split("/", each.value), length(each.value))}-${var.private_dns_zone_name}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = each.value
}