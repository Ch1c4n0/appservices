resource "azurerm_resource_group" "rg" {
  name     = lower("rg-chicano123-${var.ambiente}")
  location = var.location

}


resource "azurerm_app_service_plan" "planapp" {
  name                = lower("planappchicano123${var.ambiente}")
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }

  //  depends_on = [

  //    azurerm_resource_group.rg

  //  ]

}


resource "azurerm_app_service" "webapp1" {
    name = "appchicano123456project-${var.ambiente}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.planapp.id

site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "chave" = "123456"
  }


}