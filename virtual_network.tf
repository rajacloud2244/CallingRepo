module "virtual_network" {
  source = "git::https://rajacloud2244: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@github.com/rajacloud2244/StandardModules.git//virtual_network"
  virtual_network_name = local.virtual_network_name
  location            = local.location
  resource_group_name = local.resource_group_name 
  address_space       = local.address_space
  dns_servers         = local.dns_servers
  subnets             = local.subnets
  tags                = local.tags
}