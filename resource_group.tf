module "resource_group" {
  source = "git::https://rajacloud2244:${{ secrets.PAT_TOKEN }}@github.com/rajacloud2244/StandardModules.git//resource_group"
  resource_group_name = local.resource_group_name
  location            = local.location
  managed_by = local.managed_by
} 



