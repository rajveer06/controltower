variable "region" {
  type    = string
  default = "us-east-1"
}

variable "product_id" {
  type        = string
  description = "Service Catalog product ID"
}

variable "provisioning_artifact_id" {
  type        = string
  description = "Provisioning artifact ID for Account Factory"
}


variable "org_structure" {
  description = "Organizational structure with account metadata per OU"
  type = map(map(object({
    email      = string
    first_name = string
    last_name  = string
  })))
}

