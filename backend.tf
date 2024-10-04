
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tf"
      storage_account_name = "tf224466"
      container_name       = "learn"
      key                  = "terraform.tfstate"       #do not write name in azue portal, it will create automatically
  }

}

