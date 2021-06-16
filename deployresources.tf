#creating resource group
resource "azurerm_resource_group" "RG" {
		name = "AR_RG3"
		location = "west us"
		lifecycle {
			create_before_destroy = true
	}
}

