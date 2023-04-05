/* Firewall Connectivity -------------------------------------------------- */
panos_hostname = "10.60.0.21"

/* Network configuration -------------------------------------------------- */
eth_interfaces = [
  {
    name          = "ethernet1/1"
    mode          = "layer3"
    vsys          = "vsys1"
    dhcp          = false
    default_route = false
    ips           = ["46.58.79.2/24"]
  },
  {
    name          = "ethernet1/2"
    mode          = "layer3"
    vsys          = "vsys1"
    dhcp          = false
    default_route = false
    ips           = ["192.168.31.1/24"]
  },
  {
    name          = "ethernet1/3"
    mode          = "layer3"
    vsys          = "vsys1"
    dhcp          = false
    default_route = false
    ips           = ["10.0.31.1/24"]
  }
]

vr_name = "default"

/* Service Objects -------------------------------------------------------- */
service_objects = [
  {
    name             = "service-tcp-221"
    vsys             = "vsys1"
    protocol         = "tcp"
    description      = "Service object to map port 22 to 222"
    destination_port = "221"
  },
  {
    name             = "service-tcp-222"
    vsys             = "vsys1"
    protocol         = "tcp"
    description      = "Service object to map port 22 to 222"
    destination_port = "222"
  },
  {
    name             = "service-tcp-81"
    vsys             = "vsys1"
    protocol         = "tcp"
    description      = "Service object to map port 80 to 81"
    destination_port = "81"
  }
]

/* Security Policies ------------------------------------------------------ */

security_policies = [
  {
    name                  = "DMZ-to-WAN-allow"
    action                = "allow"
    source_zones          = ["LAN", "DMZ"]
    destination_zones     = ["WAN"]
    source_addresses      = ["any"]
    destination_addresses = ["any"]
    source_users          = ["any"]
    categories            = ["any"]
    audit_comment         = "Example security policy"
    applications          = ["any"]
    services              = ["any"]
  }
]
