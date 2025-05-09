data "aws_organizations_organization" "org" {}

locals {
  org_units = keys(var.org_structure)
}

# Create OUs
module "organizational_units" {
  for_each  = toset(local.org_units)
  source    = "./modules/organizational_unit"
  name      = each.value
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

# Create accounts using Service Catalog Account Factory
module "account_factory" {
  for_each = { for ou, accounts in var.org_structure : ou => {
    accounts = accounts
    ou_id    = module.organizational_units[ou].ou_id
  }}

  source                   = "./modules/account_factory"
  ou_id                    = each.value.ou_id
  accounts                 = each.value.accounts
  product_id               = data.aws_servicecatalog_product.account_factory.id
  provisioning_artifact_id   = data.aws_servicecatalog_provisioning_artifact.account_factory_latest.id
}

data "aws_servicecatalog_product" "account_factory" {
  id = "prod-abc123" # Replace "prod-abc123" with the actual product ID
}

data "aws_servicecatalog_provisioning_artifact" "account_factory_latest" {
  product_id = data.aws_servicecatalog_product.account_factory.id
}

