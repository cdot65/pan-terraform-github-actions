module "san_vfw_01_services" {
  source          = "../modules/services"
  service_objects = var.service_objects
  providers = {
    panos = panos
  }
}

module "san_vfw_01_auth_json" {
  source = "../modules/auth_json"

  panos_hostname = var.panos_hostname
  panos_username = var.panos_username
  panos_password = var.panos_password
}

module "san_vfw_01_network" {
  source = "../modules/network"

  eth_interfaces = var.eth_interfaces
  vr_name        = var.vr_name
  providers = {
    panos = panos
  }
}

module "san_vfw_01_security_policies" {
  source            = "../modules/security_policies"
  security_policies = var.security_policies
  providers = {
    panos = panos
  }
}
