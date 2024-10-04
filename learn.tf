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
