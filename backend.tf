
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-utb-app"
    storage_account_name = "parcial2utbnode9312"
    container_name       = "parcial2app2"
    key                  = "terraform.tfstate"
  }
}
