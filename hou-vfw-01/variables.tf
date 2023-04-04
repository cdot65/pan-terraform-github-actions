variable "panos_hostname" {
  description = "Firewall IP address"
}

variable "panos_username" {
  description = "Username to log into the firewall"
}

variable "panos_password" {
  description = "Password of user"
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
