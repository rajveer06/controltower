variable "management_account_id" {
  description = "The AWS account ID of the management account."
  type        = string
}

variable "accounts" {
  description = "List of account names for which cross-account roles need to be created."
  type        = list(string)
}
