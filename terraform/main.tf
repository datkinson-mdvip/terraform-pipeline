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

resource "azurerm_service_plan" "asp" {
  location            = var.LOCATION
  name                = "${terraform.workspace}-${local.service_name}-asp"
  os_type             = "Linux"
  resource_group_name = rg.name
  sku_name            = "B2"
  tags                = local.common_tags
}

locals {  
  service_name = "tfopenai"
  common_tags = {
    #Environment = terraform.workspace
    Source      = "Terraform"
    Portfolio   = "Business Intelligence Team"    
  }
}