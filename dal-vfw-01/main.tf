module "san_vfw_01_services" {
  source = "../modules/services"

  providers = {
    panos.shared = panos
  }

  service_objects = var.service_objects
}

module "san_vfw_01_auth_json" {
  source = "../modules/auth_json"

  panos_hostname = var.panos_hostname
  panos_username = var.panos_username
  panos_password = var.panos_password
}
