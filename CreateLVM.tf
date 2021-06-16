resource "azurerm_linux_virtual_machine" "ARmachine" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = azurerm_resource_group.RG.name
  location                        = azurerm_resource_group.RG.location
  size                            = "Standard_D2s_v3"
  admin_username                  = "ashutosh"
  admin_password                  = "ashu@123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.ARnic.id,
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}