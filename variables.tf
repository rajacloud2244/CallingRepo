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

# Step 1: Define a variable with colors and their meanings
variable "colors" {
  description = "Map of colors and their meanings"
  type        = map(string)
  default = {
    "red"    = "love"
    "blue"   = "calm"
    "green"  = "nature"
  }
}

# Step 2: Create a resource for each color using for_each
resource "null_resource" "color_meaning" {
  for_each = var.colors  # Loop over each color

  provisioner "local-exec" {
    command = "echo The color ${each.key} represents ${each.value}."
  }
}

# Step 3: Output the meanings of the colors
output "color_meanings" {
  value = [for color in keys(var.colors) : "${color} represents '${var.colors[color]}'"]
}


