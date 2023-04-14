output "url" {
  value = azurerm_app_service.webapp1.default_site_hostname
}

output "ip" {
  value = azurerm_app_service.webapp1.outbound_ip_addresses
}

output "git" {
  value = azurerm_app_service.webapp1.source_control
}