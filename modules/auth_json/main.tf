resource "local_file" "auth_json" {
  content  = jsonencode({ "hostname" = var.panos_hostname, "username" = var.panos_username, "password" = var.panos_password })
  filename = "${path.root}/auth.json"
}
