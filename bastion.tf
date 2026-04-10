resource "azurerm_subnet" "bastionsub" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/27"]
}

resource "azurerm_public_ip" "pip" {
  name                = "test-pip"
  location            = azurerm_resource_group.test-rg.location
  resource_group_name = azurerm_resource_group.test-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "basthost" {
  name                = "test-bastion"
  location            = azurerm_resource_group.test-rg.location
  resource_group_name = azurerm_resource_group.test-rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionsub.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
# VM ka Private IP dekhne ke liye (Bastion se connect karne ke liye)
output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

# Bastion ka Public IP dekhne ke liye
output "bastion_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}