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
  features {}

}

resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = "local-openai-rg"
  tags     = local.common_tags
}


locals {  
  common_tags = {
    #Environment = terraform.workspace
    Source      = "Terraform"
    Portfolio   = "Business Intelligence Team"
  }
}