/* 
Version Block
Provider
Backend
Resource
Varaible
Locals
Outputs
Data
Modules
Dynamic-Nested
*/




terraform {  
  required_version = ">= 1.0"
}

#Provider Block
provider "azurerm" {
  features {}
}

# Variable for the Azure region
variable "location" {
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

# Variable for the storage account name
variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "mystorageacct12345"  # Must be globally unique
}

# Variable for the resource group name
variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "my-resource-group"
}

# Local values
locals {
  unique_storage_account_name = "${var.storage_account_name}${substr(md5(var.resource_group_name), 0, 5)}"
}

# Data block to get the existing resource group
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Variable for network rules (optional)
variable "allowed_ip_addresses" {
  description = "A list of allowed IP addresses for the storage account"
  type        = list(string)
  default     = []  # Default to an empty list
}

# Creating the Storage Account
resource "azurerm_storage_account" "example" {
  name                     = local.unique_storage_account_name
  resource_group_name      = data.azurerm_resource_group.existing.name
  location                 = data.azurerm_resource_group.existing.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Optional: Enable HTTPS traffic only
  enable_https_traffic_only = true

  # Dynamic nested block for network rules
  dynamic "network_acls" {
    for_each = var.allowed_ip_addresses

    content {
      ip_rules {
        ip_address = network_acls.value
        action     = "Allow"
      }
    }
  }
}

# Output the Storage Account details
output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.example.primary_blob_endpoint
}

output "resource_group_name" {
  value = data.azurerm_resource_group.existing.name
}




