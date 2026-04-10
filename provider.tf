terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.62.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "6caad0e1-3e31-4888-9ab4-f7a5829c9680"

}