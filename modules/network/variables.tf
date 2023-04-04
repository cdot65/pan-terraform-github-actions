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
