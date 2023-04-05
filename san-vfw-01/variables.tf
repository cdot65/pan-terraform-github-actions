variable "panos_hostname" {
  description = "Firewall IP address"
}

variable "panos_username" {
  description = "Username to log into the firewall"
}

variable "panos_password" {
  description = "Password of user"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "service_objects" {
  description = "List of service objects to be created"
  type = list(object({
    name             = string
    vsys             = string
    protocol         = string
    description      = string
    destination_port = string
  }))
}

variable "eth_interfaces" {
  description = "List of Ethernet interfaces"
  type = list(object({
    name          = string
    mode          = string
    vsys          = string
    dhcp          = bool
    default_route = bool
    ips           = list(string)
  }))
}

variable "vr_name" {
  description = "Virtual Router name"
}

variable "security_policies" {
  description = "List of security policies"
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
