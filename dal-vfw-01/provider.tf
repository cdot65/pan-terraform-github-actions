# https://registry.terraform.io/providers/PaloAltoNetworks/panos/latest/docs
terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "1.11.0"
    }
  }
}

provider "panos" {
  hostname = var.panos_hostname
  username = var.panos_username
  password = var.panos_password
}
