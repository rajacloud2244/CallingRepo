module "cognitive_account" {
   source = "git::https://rajacloud2244:${{ secrets.PAT_TOKEN }}@github.com/rajacloud2244/StandardModules.git//cognitive_account"
  location                            = local.location
  resource_group_name                 = local.resource_group_name
  cognitive_account_name              = local.cognitive_account_name  
  sku_name                            = local.sku_name_cognitive_account
  kind                                = local.cognitivekind
}
