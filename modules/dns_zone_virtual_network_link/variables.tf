variable "resource_group_name" {
  type = string
}

variable "private_dns_zone_name" {
  type = string
}

variable "virtual_network_ids" {
  type = list(string)
}
