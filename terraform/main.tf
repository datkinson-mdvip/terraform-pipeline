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


locals {  
  common_tags = {
    #Environment = terraform.workspace
    Source      = "Terraform"
    Portfolio   = "Business Intelligence Team"
  }
}