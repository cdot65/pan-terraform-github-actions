locals {
  ethernet_interfaces = [
    for idx, eth in var.eth_interfaces : {
      name                      = eth.name
      mode                      = eth.mode
      vsys                      = eth.vsys
      enable_dhcp               = lookup(eth, "enable_dhcp", false)
      create_dhcp_default_route = lookup(eth, "create_dhcp_default_route", false)
      static_ips                = lookup(eth, "static_ips", null)
    }
  ]
}

resource "panos_ethernet_interface" "this" {
  for_each = { for iface in var.eth_interfaces : iface.name => iface }

  name                      = each.value.name
  mode                      = each.value.mode
  vsys                      = each.value.vsys
  static_ips                = lookup(each.value, "ips", null)
  enable_dhcp               = lookup(each.value, "dhcp", false)
  create_dhcp_default_route = lookup(each.value, "default_route", false)
}

resource "panos_virtual_router" "default_vr" {
  name       = var.vr_name
  interfaces = [for eth in local.ethernet_interfaces : eth.name]
  depends_on = [panos_ethernet_interface.this]
}
