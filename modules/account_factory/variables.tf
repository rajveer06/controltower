variable "ou_id" {
  type        = string
  description = "Organizational Unit ID where accounts will be provisioned."
}

variable "accounts" {
  type = map(object({
    email      = string
    first_name = string
    last_name  = string
  }))
}


variable "product_id" {
  type        = string
  description = "Service Catalog product ID for AWS Control Tower Account Factory"
}

variable "provisioning_artifact_id" {
  type        = string
  description = "Provisioning artifact ID for the Account Factory product"
}

