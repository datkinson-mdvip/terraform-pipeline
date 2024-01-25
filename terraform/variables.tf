variable "SUBSCRIPTION_ID" {
  type = string  
}
variable "ENVIRONMENT" {
  type = string
}
variable "LOCATION" {
  type = string  
}
variable "SERVICE_NAME" {
  type = string
}
variable "RESOURCE_GROUP_NAME" {
  type = string  
}
variable "ASP_OS_TYPE" {
  type = string
  default = "Linux"  
}
variable "ASP_SKU_NAME" {
  type = string
  default = "B2"
}