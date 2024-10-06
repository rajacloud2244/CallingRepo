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
-----------------------------------------------------------------------------------------------
In programming, particularly in languages like TypeScript, the terms Map<Object> and Map<any> refer to generic types that describe maps (or dictionaries) with specific key-value pair structures.

Map<Object>:
This specifies that the keys in the map are of type Object, which means any non-primitive type (like arrays, functions, or user-defined objects).
The values can be of any type, depending on how you define the map.
Example: const objMap: Map<Object, string> = new Map();

Map<any>:
This indicates that both the keys and values can be of any type, including primitives (like numbers, strings, booleans) and objects.
This makes the map very flexible, but it can also lead to less type safety.
Example: const anyMap: Map<any, any> = new Map();
-------------------------------------------------------------------------------------------------
The count parameter allows you to specify how many copies of a resource you want to create. For example, if you want to create three virtual machines, you can set count to 3.
The count parameter allows you to create multiple instances of a resource in Terraform.
The expression ${count.index + 1} is used to make the numbering more user-friendly.
Since count.index starts from 0, adding 1 shifts the numbering to start from 1

Why + 1?:
The expression ${count.index + 1} is used to make the numbering more user-friendly.
Since count.index starts from 0, adding 1 shifts the numbering to start from 1.
So, instead of showing “Flower 0”, “Flower 1”, and “Flower 2”, it will show “Flower 1”, “Flower 2”, and “Flower 3”.

Count Index:
The count parameter allows you to create multiple instances of a resource in Terraform.
For each instance created, Terraform automatically assigns an index to it, starting from 0.
For example, if you set count = 3, the index values for the created instances will be:
Instance 1: count.index = 0
Instance 2: count.index = 1


*/
Instance 3: count.index = 2
----------------------------------------------------------------------------------------------------------------

*/
