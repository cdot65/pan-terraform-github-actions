terraform {
  required_providers {
    panos = {
      source                = "PaloAltoNetworks/panos"
      version               = "1.11.0"
      configuration_aliases = [panos.shared]
    }
  }
}
