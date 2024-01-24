variable "SUBSCRIPTION_ID" {
  type = string
  description = "The Azure subscription ID to use"
  default = "71dcf979-c04c-4aec-9de1-bf4086b36519"
  
}
variable "LOCATION" {
  type = string
  description = "The Azure location to use"
  
}
variable "RESOURCE_GROUP_NAME" {
  type = string
  description = "The name of the resource group in which to create the resources"
  
}