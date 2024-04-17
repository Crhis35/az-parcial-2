resource "azurerm_resource_group" "resource_group" {
  name     = var.rg-name
  location = var.location
}


resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

module "app-service" {
  source    = "./modules/app-service"
  apps_name = var.apps_name

  resource_group = {
    name     = azurerm_resource_group.resource_group.name,
    location = azurerm_resource_group.resource_group.location,
  }
  depends_on = [
    azurerm_resource_group.resource_group,
  ]
}
module "network" {
  source             = "./modules/network"
  vn_name            = var.vn_name
  cloud_shell_source = var.cloud_shell_source
  management_ip      = var.management_ip

  app_service_ips = module.app-service.app_service_ips
  resource_group = {
    name     = azurerm_resource_group.resource_group.name,
    location = azurerm_resource_group.resource_group.location,
  }
  depends_on = [
    azurerm_resource_group.resource_group
  ]
}


module "vm-database" {
  source    = "./modules/vm"
  subnet_id = module.network.subnet_id
  net_id    = module.network.vn_id
  nsg_id    = module.network.nsg_id
  resource_group = {
    name     = azurerm_resource_group.resource_group.name,
    location = azurerm_resource_group.resource_group.location,
  }
  depends_on = [
    azurerm_resource_group.resource_group,
    module.network
  ]
}




