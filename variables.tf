# String
variable "name" {
  description = "The name of the person"
  type        = string
  default     = "Raja"
}

# Create a greeting message
output "greeting" {
  value = "Hello, ${var.name}! Welcome to your new adventure!"
}


# Define a variable for the list of fruits
variable "fruits" {
  description = "A list of fruits"
  type        = list(string)
  default     = ["Apple", "Banana", "Cherry", "Date"]
}

# Output the list of fruits
output "fruit_list" {
  value = var.fruits
}


# Define a variable for the map of fruits
variable "fruit_info" {
  description = "A map of fruits with their colors and prices"
  type        = map(object({
    color  = string
    price  = number
  }))
  default = {
    Apple  = { color = "Red", price = 1.2 }
    Banana = { color = "Yellow", price = 0.5 }
    Cherry = { color = "Red", price = 2.0 }
  }
}

# Apple, banana , cherr is keys

# Output the information for each fruit
output "fruits" {
  value = var.fruit_info
}

# Define a variable for the snack choice
variable "eat_apple" {
  description = "Should we eat an apple?"
  type        = bool
  default     = true  # Change this to false to choose the cookie
}

# Output the snack choice
output "snack_choice" {
  value = var.eat_apple ? "Let's eat an apple!" : "Let's eat a cookie!"
}

# Define a variable for how many flowers to plant
variable "flower_count" {
  description = "Number of flowers to plant"
  type        = number
  default     = 4  # Change this number to plant more or fewer flowers
}

# Create a flower bed resource
resource "null_resource" "flower" {
  count = var.flower_count  # This tells Terraform how many flowers to plant
  provisioner "local-exec" {
    command = "echo Planting flower number ${count.index + 1}"  # Each flower has a unique name
  }
}

# Create a list of flower names
locals {
  flower_names = [for i in range(var.flower_count) : "Flower ${i + 1}"]
}

# Output the names of the planted flowers
output "planted_flower_names" {
  value = local.flower_names
}

provider "null" {}  # We use a null provider for demonstration

variable "animal_sounds" {
  description = "Map of animals and their sounds"
  type        = map(string)
  default     = {
    "dog"   = "bark"
    "cat"   = "meow"
    "cow"   = "moo"
  }  # A map of animals and their sounds
}

resource "null_resource" "animal_greetings" {
  for_each = var.animal_sounds  # Loop through each animal in the map

  provisioner "local-exec" {
    command = "echo The ${each.key} goes '${each.value}'!"  # Print a greeting for each animal
  }
}

/*
variable "vm_configs" {
  description = "Map of Virtual Machines configurations"
  type        = map(object({
    admin_username = string
    admin_password = string
    size           = string
  }))
  default = {
    "vm1" = {
      admin_username = "adminuser1"
      admin_password = "P@ssw0rd123!"
      size           = "Standard_DS1_v2"
    },
    "vm2" = {
      admin_username = "adminuser2"
      admin_password = "P@ssw0rd123!"
      size           = "Standard_DS1_v2"
    },
    "vm3" = {
      admin_username = "adminuser3"
      admin_password = "P@ssw0rd123!"
      size           = "Standard_DS1_v2"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  for_each = var.vm_configs

  name                = "${each.key}-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    private_ip_address_allocation = "Dynamic"
    subnet_id                    = azurerm_subnet.example.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vm_configs

  name                = each.key
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    azurerm_network_interface.example[each.key].id,
  ]

  os_disk {
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
}

output "virtual_machine_names" {
  value = [for vm in azurerm_linux_virtual_machine.example : vm.name]
}
*/


