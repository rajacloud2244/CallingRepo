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

variable "additional_conditions" {
  description = "Additional conditions to check"
  default     = [true, true]  # All conditions true
}

variable "negative_number" {
  description = "A negative number"
  default     = -42
}

# Ensure this is defined as a list of numbers
variable "number_list" {
  description = "A list of numbers"
  type        = list(number)  # Specify the type explicitly
  default     = [10, 20, 5, 30]
}

variable "additional_fruits" {
  description = "Additional fruits to add to the list"
  default     = ["date", "elderberry"]
}

variable "nested_fruit_lists" {
  description = "A list of lists of fruits"
  default     = [["fig", "grape"], ["honeydew", "kiwi"]]
}

# Local values
locals {
  unique_fruit_set         = toset(var.fruit_list)            # Converts list to set
  are_all_conditions_true   = alltrue(concat(var.conditions, var.additional_conditions))  # Checks if all are true
  absolute_value            = abs(var.negative_number)         # Gets the absolute value
  upper_case_fruit          = upper(join(", ", var.fruit_list))  # Converts fruits to upper case
  lower_case_fruit          = lower(join(", ", var.fruit_list))  # Converts fruits to lower case
  min_number                = min(var.number_list)             # Finds the minimum number
  max_number                = max(var.number_list)             # Finds the maximum number
  combined_fruits           = concat(var.fruit_list, var.additional_fruits)  # Combines two lists
  current_timestamp          = timestamp()                      # Gets the current timestamp
  future_timestamp           = timeadd(current_timestamp, "48h")  # Adds 48 hours to the current timestamp
  flattened_fruit_list      = flatten(var.nested_fruit_lists)  # Flattens a list of lists
  joined_fruits             = join(", ", local.combined_fruits)  # Joins fruits into a single string
  split_fruits              = split(", ", local.joined_fruits)  # Splits the joined string back into a list
  merged_fruit_lists        = merge({ a = ["mango"] }, { b = ["nectarine", "orange"] })  # Merges two maps
  sliced_fruit_list         = slice(var.fruit_list, 1, 3)      # Slices the fruit list from index 1 to 2
  unique_combined_fruit_set = toset(local.combined_fruits)      # Converts the combined list to a set
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

output "upper_case_fruit" {
  value = local.upper_case_fruit
}

output "lower_case_fruit" {
  value = local.lower_case_fruit
}

output "min_number" {
  value = local.min_number
}

output "max_number" {
  value = local.max_number
}

output "combined_fruits" {
  value = local.combined_fruits
}

output "current_timestamp" {
  value = local.current_timestamp
}

output "future_timestamp" {
  value = local.future_timestamp
}

output "flattened_fruit_list" {
  value = local.flattened_fruit_list
}

output "joined_fruits" {
  value = local.joined_fruits
}

output "split_fruits" {
  value = local.split_fruits
}

output "merged_fruit_lists" {
  value = local.merged_fruit_lists
}

output "sliced_fruit_list" {
  value = local.sliced_fruit_list
}

output "unique_combined_fruit_set" {
  value = local.unique_combined_fruit_set
}
