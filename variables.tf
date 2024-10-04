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

# Define a variable for enabling a feature
variable "enable_feature" {
  description = "Whether to enable the feature"
  type        = bool
  default     = false  # Change to true to enable the feature
}
