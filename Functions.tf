terraform {
  required_version = ">= 1.0"
}

# Variables
variable "name0" {
  description = "Base name for resources"
  default     = "MyResource"
}

variable "number_list" {
  description = "A list of numbers"
  default     = [5, 10, 15, 20]
}

variable "ip_list" {
  description = "A list of IP addresses"
  default     = ["192.168.1.1", "10.0.0.1"]
}

# Local values
locals {
  # Using upper and lower functions
  upper_name       = upper(var.name0)
  lower_name       = lower(var.name0)

  # Using max and min functions
  max_value        = max(var.number_list...)
  min_value        = min(var.number_list...)

  # Using concat function
  additional_ips   = ["172.16.0.1", "192.168.1.2"]
  combined_ips     = concat(var.ip_list, local.additional_ips)

  # Using timestamp function
  current_timestamp = timestamp()

  # Using timeadd function
  future_time      = timeadd(local.current_timestamp, "48h")  # Adds 48 hours to current time
}

# Output results
output "upper_name" {
  value = local.upper_name
}

output "lower_name" {
  value = local.lower_name
}

output "max_value" {
  value = local.max_value
}

output "min_value" {
  value = local.min_value
}

output "combined_ips" {
  value = local.combined_ips
}

output "current_timestamp" {
  value = local.current_timestamp
}

output "future_time" {
  value = local.future_time
}

# Variables
variable "sample_list" {
  description = "A list of sample values"
  default     = ["apple", "banana", "cherry"]
}

variable "sample_map" {
  description = "A sample map of fruits and their colors"
  default     = {
    apple  = "red"
    banana = "yellow"
    cherry = "red"
  }
}

# Local values
locals {
  # Using length function
  list_length = length(var.sample_list)  # Gets the length of the list

  # Using lookup function
  banana_color = lookup(var.sample_map, "banana", "unknown")  # Looks up banana's color

  # Using join function
  fruits_string = join(", ", var.sample_list)  # Joins list into a string

  # Using zipmap function
  fruit_names = ["apple", "banana", "cherry"]
  fruit_colors = ["red", "yellow", "red"]
  fruit_map    = zipmap(local.fruit_names, local.fruit_colors)  # Creates a map from two lists

  # Using true and false
  is_fruit = true
  is_empty = false
}

# Output results
output "list_length" {
  value = local.list_length
}

output "banana_color" {
  value = local.banana_color
}

output "fruits_string" {
  value = local.fruits_string
}

output "fruit_map" {
  value = local.fruit_map
}

output "is_fruit" {
  value = local.is_fruit
}

output "is_empty" {
  value = local.is_empty
}

