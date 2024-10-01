module "cognitive_search" {
  source = "git::https://rajacloud2244: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@github.com/rajacloud2244/StandardModules.git//cognitive_search_service"
  search_service_name             = local.search_service_name
  resource_group_name = local.resource_group_name
  location            = local.location
  sku = local.sku
  local_authentication_enabled = local.local_authentication_enabled
  authentication_failure_mode  = local.authentication_failure_mode
  allowed_ips = local.allowed_ips
  customer_managed_key_enforcement_enabled = local.customer_managed_key_enforcement_enabled
  hosting_mode = local.hosting_mode
  partition_count = local.partition_count
  replica_count   = local.replica_count
  semantic_search_sku = local.semantic_search_sku
  public_network_access_enabled = local.public_network_access_enabled
}
