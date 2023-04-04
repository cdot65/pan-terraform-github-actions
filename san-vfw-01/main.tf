module "san_vfw_01_services" {
  source = "../modules/panos_firewall"

  providers = {
    panos.shared = panos
  }

  service_objects = var.service_objects
}
