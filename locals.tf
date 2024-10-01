locals {

  #RG
  location = "eastus"
  resource_group_name        = "example-resource-group"
  managed_by = "terraform"

  #Vnet and SUbnet
  virtual_network_name = "example-network"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.0.2.0/24"]

    }

  ]

#SA
  storage_account_name                = "kzeubr878shdevsb01"
  account_tier                        = "Standard"
  account_replication_type            = "GRS"
  account_kind                        = "StorageV2"
  access_tier                         = "Hot"
  min_tls_version                     = "TLS1_2"
  https_traffic_only_enabled          = true
  allow_nested_items_to_be_public     = false
  shared_access_key_enabled           = true
  is_hns_enabled                      = true
  ross_tenant_replication_enabled     = true
  edge_zone                           = null  # Optional

  default_to_oauth_authentication     = false
  nfsv3_enabled                       = false
  customer_managed_key                = null  # Optional

  blob_delete_retention_days          = 7
  permanent_delete_enabled             = false
  versioning_enabled                   = false
  change_feed_enabled                  = false

  queue_cors_allowed_headers           = ["*"]
  queue_cors_allowed_methods           = ["GET", "POST"]
  queue_cors_allowed_origins           = ["*"]
  queue_cors_exposed_headers           = ["x-ms-*"]
  queue_cors_max_age                   = 3600

  queue_logging_retention_days         = 30
  queue_minute_metrics_retention_days  = 30
  queue_hour_metrics_retention_days     = 30

  routing                              = {
    publish_internet_endpoints   = true
    publish_microsoft_endpoints   = true
    choice                        = "MicrosoftRouting"
  }

  static_website                     = {
    index_document      = "index.html"
    error_404_document  = "404.html"
  }

#Search Service
  search_service_name = "example-search-service"     # Must be globally unique
  sku                 = "standard"                    # SKU type
  local_authentication_enabled = true
  authentication_failure_mode  = "http403"
  allowed_ips = []  # Allow all public access
  customer_managed_key_enforcement_enabled = false
  hosting_mode        = "default"                    # Options: "default" or "highDensity"
  partition_count     = 1                             # Number of partitions
  replica_count       = 1                             # Number of replicas
  semantic_search_sku = "standard"                    # Semantic search SKU
  public_network_access_enabled = true                # Enable public access

  #Cognitive Account
  cognitive_account_name  = "terraformcognitiveaccount"
  sku_name_cognitive_account = "S0"
  cognitivekind = "CognitiveServices" 


  tags                           = {
    environment = "staging"
    project     = "Learing Terraforr"
  }


}
