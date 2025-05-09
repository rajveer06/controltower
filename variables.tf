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
  type = map(list(string))
  default = {
    "Non-Prod" = ["Dev", "Stage", "Test"]
    "Prod"     = ["Prod-US", "Prod-India"]
  }
}
