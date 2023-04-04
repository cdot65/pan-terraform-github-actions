variable "security_policies" {
  description = "List of security policies to be created"
  type = list(object({
    name                  = string
    audit_comment         = string
    source_zones          = list(string)
    source_addresses      = list(string)
    source_users          = list(string)
    destination_zones     = list(string)
    destination_addresses = list(string)
    applications          = list(string)
    services              = list(string)
    categories            = list(string)
    action                = string
  }))
}
