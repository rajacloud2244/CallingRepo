# Terraform Concepts

## Terraform Configuration Structure

- **`Version Block`**: Specifies the required Terraform version.
- **`Provider`**: Configures the provider to manage resources on a specific platform.
- **`Backend`**: Defines where Terraform's state file is stored.
- **`Resource`**: Specifies the resources that Terraform will create and manage.
- **`Variable`**: Declares input parameters for configuration.
- **`Locals`**: Defines reusable local values within the configuration.
- **`Outputs`**: Defines values that can be returned after the execution of the configuration.
- **`Data`**: Fetches information from existing resources outside the configuration.
- **`Modules`**: Encapsulates reusable configurations for better organization.
- **`Dynamic-Nested`**: Dynamic blocks in Terraform are used to create repeating sections of configuration based on a list or set of values. This means you can create multiple similar settings without repeating code.

## Callings

- **`var.`**: Used to reference input variables defined in a module. For example, `var.instance_type` accesses a variable named `instance_type`.
- **`local.`**: Refers to local values defined in a `locals` block. For example, `local.my_value`.
- **`data.`**: Used to reference data sources, which allow you to fetch information from outside your configuration. For example, `data.aws_ami.example`.
- **`module.`**: Used to reference outputs from a child module. For example, `module.network.vpc_id` accesses the `vpc_id` output from a module named `network`.
- **`output.`**: Used to reference output values defined in a module. For example, `output.my_output`.
- **`resource.`**: Refers to resource attributes in your configuration. For example, `resource.aws_instance.example.id` retrieves the ID of an instance resource.
- **`count.index`**: Used within a resource that uses the `count` meta-argument to reference the index of the current instance being created. For example, `aws_instance.example[count.index]`.
- **`each.value`**: Used in `for_each` loops to access the current item in the iteration. For example, `each.value` within a resource block that uses `for_each`.

## Terraform Documentation

- **`Argument References`**: Distinction between mandatory and optional arguments when defining resources, data sources, or modules.
- **`Attribute Reference`**: Accessing attributes of resources or data blocks, e.g., `data.aws_ami.example.id`.
- **`Timeouts`**: Configuring timeouts for operations on resources to specify how long to wait for certain actions to complete.
- **`Optional Blocks`**: Blocks that are not required but can be included for additional configuration. For example, a subnet block in an AWS VPC configuration.
- **`Parameters in Standard Modules`**: When calling modules in calling repo, it’s essential to pass all required parameters that are in standard repo (like location, name)
- **`Dynamic Blocks`**: Used to generate nested blocks dynamically within resources or modules, useful for situations where the number of sub-blocks can vary.

# Terraform Conditional Constructs

## 1. Conditional Expressions

Conditional expressions allow you to set values based on a condition.

**Syntax:**
```hcl
1. result = condition ? true_value : false_value


# Azure Storage Account Example

This document provides an example of how to conditionally create an Azure Storage Account using Terraform.

## Terraform Code

```hcl
2. resource "azurerm_storage_account" "example" {
  count                    = var.create_storage ? 1 : 0
  name                     = "examplestoracc"
  resource_group_name      = "example-rg"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type  = "LRS"
}


