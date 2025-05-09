resource "aws_servicecatalog_provisioned_product" "account" {
  for_each = var.accounts

  name                      = "ct-${lower(each.key)}"
  product_id                = var.product_id
  provisioning_artifact_id = var.provisioning_artifact_id

  provisioning_parameters {
    key   = "AccountName"
    value = each.key
  }
  provisioning_parameters {
    key   = "SSOUserEmail"
    value = each.value.email
  }
  provisioning_parameters {
    key   = "SSOUserFirstName"
    value = each.value.first_name
  }
  provisioning_parameters {
    key   = "SSOUserLastName"
    value = each.value.last_name
  }
  provisioning_parameters {
    key   = "ManagedOrganizationalUnit"
    value = var.ou_id
  }
}
