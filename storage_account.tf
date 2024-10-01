module "storage_account" {
   source = "git::https://rajacloud2244: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@github.com/rajacloud2244/StandardModules.git//storage_account/"
  storage_account_name       = local.storage_account_name
  resource_group_name        = local.resource_group_name
  location                   = local.location
  account_tier               = local.account_tier
  account_replication_type    = local.account_replication_type
  account_kind               = local.account_kind
  access_tier                = local.access_tier
  min_tls_version            = local.min_tls_version
  https_traffic_only_enabled   = local.https_traffic_only_enabled
  allow_nested_items_to_be_public = local.allow_nested_items_to_be_public
  shared_access_key_enabled   = local.shared_access_key_enabled
  is_hns_enabled              = local.is_hns_enabled
  ross_tenant_replication_enabled = local.ross_tenant_replication_enabled
  edge_zone                  = local.edge_zone
  public_network_access_enabled = local.public_network_access_enabled
  default_to_oauth_authentication = local.default_to_oauth_authentication
  nfsv3_enabled              = local.nfsv3_enabled
  customer_managed_key       = local.customer_managed_key

  blob_delete_retention_days  = local.blob_delete_retention_days
  permanent_delete_enabled     = local.permanent_delete_enabled
  versioning_enabled           = local.versioning_enabled
  change_feed_enabled          = local.change_feed_enabled

  queue_cors_allowed_headers    = local.queue_cors_allowed_headers
  queue_cors_allowed_methods    = local.queue_cors_allowed_methods
  queue_cors_allowed_origins    = local.queue_cors_allowed_origins
  queue_cors_exposed_headers    = local.queue_cors_exposed_headers
  queue_cors_max_age            = local.queue_cors_max_age

  queue_logging_retention_days   = local.queue_logging_retention_days
  queue_minute_metrics_retention_days = local.queue_minute_metrics_retention_days
  queue_hour_metrics_retention_days = local.queue_hour_metrics_retention_days

  routing                      = local.routing
  static_website               = local.static_website

  tags = local.tags
}