/*
Curly Braces {}: Define maps (key-value pairs).
Square Brackets []: Define lists (ordered collections).
Parentheses (): Used for grouping expressions and function calls.
condition ? true_value : false_value
 The question mark is used to create a concise conditional expression that evaluates a condition and returns one of two values based on whether the condition is true or false.

*/


terraform {
  required_version = ">= 1.0"
}

# Variable definitions
variable "num1" {
  description = "First number"
  default     = 10
}

variable "num2" {
  description = "Second number"
  default     = 5
}

variable "csv_string" {
  description = "A comma-separated string of fruits"
  default     = "apple,banana,cherry"
}

# Local values
locals {
  # Arithmetic operations
  sum          = var.num1 + var.num2                # Addition
  difference   = var.num1 - var.num2                # Subtraction
  product      = var.num1 * var.num2                # Multiplication
  quotient     = var.num1 / var.num2                # Division
  modulus      = var.num1 % var.num2                 # Modulus

  # Comparison operations
  is_equal     = var.num1 == var.num2               # Equal to
  is_not_equal = var.num1 != var.num2               # Not equal to
  is_greater   = var.num1 > var.num2                 # Greater than
  is_less      = var.num1 < var.num2                 # Less than

  # Logical operations
  logical_and  = (var.num1 > 5 && var.num2 < 10)    # Logical AND
  logical_or   = (var.num1 < 5 || var.num2 < 10)    # Logical OR
  logical_not  = !(var.num1 == var.num2)            # Logical NOT

  # String operations
  fruit_list   = split(",", var.csv_string)          # Split string into list
  joined_fruit_string = join(" | ", local.fruit_list) # Join list back into string
}

# Output results
output "sum" {
  value = local.sum
}

output "difference" {
  value = local.difference
}

output "product" {
  value = local.product
}

output "quotient" {
  value = local.quotient
}

output "modulus" {
  value = local.modulus
}

output "is_equal" {
  value = local.is_equal
}

output "is_not_equal" {
  value = local.is_not_equal
}

output "is_greater" {
  value = local.is_greater
}

output "is_less" {
  value = local.is_less
}

output "logical_and" {
  value = local.logical_and
}

output "logical_or" {
  value = local.logical_or
}

output "logical_not" {
  value = local.logical_not
}

output "joined_fruit_string" {
  value = local.joined_fruit_string
}



