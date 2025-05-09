output "account_names" {
  description = "Names of provisioned accounts"
  value       = [for a in aws_servicecatalog_provisioned_product.account : a.name]
}

output "account_ids" {
  description = "IDs of the provisioned products (not the AWS Account ID, but the Service Catalog product ID)"
  value       = [for a in aws_servicecatalog_provisioned_product.account : a.id]
}
