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

# Define a variable for how many cookies to bake
variable "cookie_count" {
  description = "Number of cookies to bake"
  type        = number
  default     = 5  # You can change this number to bake more or fewer cookies
}

# Create a list of cookies
resource "null_resource" "cookie" {
  count = var.cookie_count  # This tells Terraform how many cookies to make

  # Each cookie has a unique name
  provisioner "local-exec" {
    command = "echo Baking cookie number ${count.index + 1}"
  }
}

# Output the total number of cookies baked
output "total_cookies_baked" {
  value = var.cookie_count
}
