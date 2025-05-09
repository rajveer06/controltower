resource "aws_servicecatalog_provisioned_product" "account" {
  for_each = toset(var.accounts)

  name              = "ct-${lower(each.value)}"
  product_id        = data.aws_servicecatalog_product.account_factory.id
  provisioning_artifact_id = data.aws_servicecatalog_provisioning_artifact.account_factory_latest.id
  dynamic "provisioning_parameters" {
    for_each = [
      {
        key   = "AccountName"
        value = each.value
      },
      {
        key   = "Email"
        value = "${lower(each.value)}@gmail.com"
      },
      {
        key   = "SSOUserEmail"
        value = "${lower(each.value)}@gmail.com"
      },
      {
        key   = "SSOUserFirstName"
        value = "First"
      },
      {
        key   = "SSOUserLastName"
        value = "Last"
      },
      {
        key   = "ManagedOrganizationalUnit"
        value = var.ou_id
      },
      {
        key   = "AccountType"
        value = "Standard"
      }
    ]
    content {
      key   = provisioning_parameters.value.key
      value = provisioning_parameters.value.value
    }
  }
  tags = {
    Environment = "ControlTower"
  }
}

data "aws_servicecatalog_product" "account_factory" {
  name = "AWS Control Tower Account Factory"
  id   = var.product_id
}

data "aws_servicecatalog_provisioning_artifact" "account_factory_latest" {
  product_id = data.aws_servicecatalog_product.account_factory.id
  depends_on = [data.aws_servicecatalog_product.account_factory]
}
