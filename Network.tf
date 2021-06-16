#IMP: Took help from = https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/examples/virtual-machines/linux/basic-password/main.tf

resource "azurerm_virtual_network" "ARnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.ARnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "ARnic" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}