resource "azurerm_public_ip" "pip" {
  name                = "test-pip"
  location            = azurerm_resource_group.test-rg.location
  resource_group_name = azurerm_resource_group.test-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

