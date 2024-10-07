terraform {
  required_version = ">= 1.0"
}

# Variable definitions
variable "fruit_list" {
  description = "A list of fruits"
  default     = ["apple", "banana", "cherry", "apple"]  # Notice the duplicate "apple"
}

variable "conditions" {
  description = "A list of conditions"
  default     = [true, true, false]
}

variable "negative_number" {
  description = "A negative number"
  default     = -42
}

# Local values
locals {
  unique_fruit_set         = toset(var.fruit_list)            # Converts list to set
  are_all_conditions_true   = alltrue(var.conditions)          # Checks if all are true
  absolute_value            = abs(var.negative_number)         # Gets the absolute value
}

# Output results
output "unique_fruit_set" {
  value = local.unique_fruit_set
}

output "are_all_conditions_true" {
  value = local.are_all_conditions_true
}

output "absolute_value" {
  value = local.absolute_value
}
