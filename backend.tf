
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
      container_name       = "tfstate"
      key                  = "terraform.tfstate" # Automatically these file created at TF int, we need to give file name here
  }

}

