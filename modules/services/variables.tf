variable "service_objects" {
  description = "List of service objects for the firewall"
  type = list(object({
    name             = string
    vsys             = string
    protocol         = string
    description      = string
    destination_port = string
  }))
}
