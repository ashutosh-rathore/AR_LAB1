resource "azurerm_automation_module" "AzAccounts" {
  name                    = "Az.Accounts"
  resource_group_name     = azurerm_resource_group.RG.name
  automation_account_name = azurerm_automation_account.AR_Auto.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/az.accounts/2.3.0"
  }
}

resource "azurerm_automation_module" "AzResources" {
  name                    = "Az.Resources"
  resource_group_name     = azurerm_resource_group.RG.name
  automation_account_name = azurerm_automation_account.AR_Auto.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/Az.Resources/4.1.1"
  }
depends_on = [azurerm_automation_module.AzAccounts]
}

resource "azurerm_automation_module" "AzCompute" {
  name                    = "Az.Compute"
  resource_group_name     = azurerm_resource_group.RG.name
  automation_account_name = azurerm_automation_account.AR_Auto.name

  module_link {
    uri = "https://www.powershellgallery.com/api/v2/package/Az.Compute/4.13.0"
  }
depends_on = [azurerm_automation_module.AzAccounts]
}