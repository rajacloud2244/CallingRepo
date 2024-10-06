terraform {
  required_version = ">= 1.0"
}

# Variables
variable "name" {
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
  upper_name       = upper(var.name)
  lower_name       = lower(var.name)

  # Using max and min functions
  max_value        = max(var.number_list...)
  min_value        = min(var.number_list...)

  # Using concat function
  additional_ips   = ["172.16.0.1", "192.168.1.2"]
  combined_ips     = concat(var.ip_list, additional_ips)

  # Using timestamp function
  current_timestamp = timestamp()

  # Using timeadd function
  future_time      = timeadd(current_timestamp, "48h")  # Adds 48 hours to current time
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

