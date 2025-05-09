variable "region" {
  type    = string
  default = "us-east-1"
}

variable "org_structure" {
  type = map(list(string))
  default = {
    "Non-Prod" = ["Dev", "Stage", "Test"]
    "Prod"     = ["Prod-US", "Prod-India"]
    "Shared"   = ["Shared-Services"]
    "Security" = ["Audit", "Log-Archive"]
  }
}
