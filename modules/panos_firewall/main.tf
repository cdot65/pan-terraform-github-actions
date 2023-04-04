resource "panos_service_object" "service_tcp" {
  for_each = { for obj in var.service_objects : obj.name => obj }

  name             = each.value.name
  vsys             = each.value.vsys
  protocol         = each.value.protocol
  description      = each.value.description
  destination_port = each.value.destination_port
}
