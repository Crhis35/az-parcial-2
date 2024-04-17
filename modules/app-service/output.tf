
output "hostnames" {
  value = [
    for instance in azurerm_linux_web_app.frontend : instance.default_hostname
  ]
}

output "app_service_ips" {
  value = [
    for instance in azurerm_linux_web_app.frontend : instance.outbound_ip_addresses
  ]
}
