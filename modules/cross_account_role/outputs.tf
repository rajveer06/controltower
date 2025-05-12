output "cross_account_role_arn" {
  description = "The ARN of the cross-account role created in each account."
  value       = aws_iam_role.cross_account_role.*.arn
}
