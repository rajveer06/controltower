resource "aws_iam_role" "cross_account_role" {
  for_each = toset(var.accounts)

  name = "ManagementAccountRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.management_account_id}:root"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  }
  
  resource "aws_iam_policy" "full_access_policy" {
    name        = "FullAccessPolicy"
    description = "Policy granting full access"
    policy      = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "*"
          Resource = "*"
        },
      ]
    })
  }
  
  resource "aws_iam_role_policy_attachment" "attach_full_access_policy" {
    for_each       = toset(var.accounts)
    role           = aws_iam_role.cross_account_role[each.key].name
    policy_arn     = aws_iam_policy.full_access_policy.arn
  }

