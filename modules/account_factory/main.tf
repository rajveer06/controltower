resource "aws_servicecatalog_provisioned_product" "account" {
  for_each = toset(var.accounts)

  name                        = "ct-${lower(each.value)}"
  product_id                  = var.product_id
  provisioning_artifact_id    = var.provisioning_artifact_id
  dynamic "provisioning_parameters" {
    for_each = [
      {
        key   = "AccountName"
        value = each.value
      },
      {
        key   = "SSOUserEmail"
        value = "user+${lower(each.value)}@example.com"
      },
      {
        key   = "SSOUserFirstName"
        value = each.value
      },
      {
        key   = "SSOUserLastName"
        value = "Admin"
      },
      {
        key   = "ManagedOrganizationalUnit"
        value = var.ou_id
      }
    ]
    content {
      key   = provisioning_parameters.value.key
      value = provisioning_parameters.value.value
    }
  }
}
