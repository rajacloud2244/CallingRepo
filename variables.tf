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





