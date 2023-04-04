resource "panos_security_policy" "policy" {
  for_each = { for policy in var.security_policies : policy.name => policy }

  rule {
    name                  = each.value.name
    audit_comment         = each.value.audit_comment
    source_zones          = each.value.source_zones
    source_addresses      = each.value.source_addresses
    source_users          = each.value.source_users
    destination_zones     = each.value.destination_zones
    destination_addresses = each.value.destination_addresses
    applications          = each.value.applications
    services              = each.value.services
    categories            = each.value.categories
    action                = each.value.action
  }

  lifecycle {
    create_before_destroy = true
  }
}
