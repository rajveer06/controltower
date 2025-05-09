variable "ou_id" {
  type        = string
  description = "Organizational Unit ID where accounts will be provisioned."
}

variable "accounts" {
  type        = list(string)
  description = "List of account names to create under this OU."
}

variable "product_id" {
  type        = string
  description = "Service Catalog Product ID for Account Factory."
}
