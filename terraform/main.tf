terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.82.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = true
  subscription_id = var.SUBSCRIPTION_ID
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.LOCATION
  name     = var.RESOURCE_GROUP_NAME
  tags     = local.common_tags
}

data "azurerm_resource_group" "rg" {
  name = var.RESOURCE_GROUP_NAME
}

resource "azurerm_service_plan" "asp" {
  location            = var.LOCATION
  name                = "${var.ENVIRONMENT}-${var.SERVICE_NAME}-asp"
  os_type             = var.ASP_OS_TYPE
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.ASP_SKU_NAME
  tags                = local.common_tags
}

data "azurerm_service_plan" "asp" {
  name                = "${var.ENVIRONMENT}-${var.SERVICE_NAME}-asp"
  resource_group_name = azurerm_resource_group.rg.name
}

locals {  
  common_tags = {
    Source      = "Terraform"
    Portfolio   = "Business Intelligence Team"    
  }
}