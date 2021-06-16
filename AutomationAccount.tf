resource "azurerm_automation_account" "AR_Auto" {
  name                = "automationAccount1"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  sku_name            = "Basic"
}

resource "azurerm_automation_runbook" "StartVM" {
  name                    = "StartVM1"
  location                = azurerm_resource_group.RG.location
  resource_group_name     = azurerm_resource_group.RG.name
  automation_account_name = azurerm_automation_account.AR_Auto.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "this is for starting VM"
  runbook_type            = "PowerShellWorkflow"

  publish_content_link {
    uri = "https://raw.githubusercontent.com/ashutosh-rathore/AR_LAB1/master/StartVM.ps1"
  }
}

resource "azurerm_automation_runbook" "StopVM" {
  name                    = "StopVM1"
  location                = azurerm_resource_group.RG.location
  resource_group_name     = azurerm_resource_group.RG.name
  automation_account_name = azurerm_automation_account.AR_Auto.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "this is for starting VM"
  runbook_type            = "PowerShellWorkflow"

  publish_content_link {
    uri = "https://raw.githubusercontent.com/ashutosh-rathore/AR_LAB1/master/StopVM.ps1"
  }
}
