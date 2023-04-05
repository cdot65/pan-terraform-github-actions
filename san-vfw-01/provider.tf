terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "~> 1.11.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "panos" {
  hostname = var.panos_hostname
  username = var.panos_username
  password = var.panos_password
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
