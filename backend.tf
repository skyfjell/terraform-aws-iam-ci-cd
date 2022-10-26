data "aws_iam_policy_document" "backend" {
  count = length(local.config_backend.role_arns) > 0 ? 1 : 0

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = local.config_backend.role_arns
  }
}

resource "aws_iam_policy" "backend" {
  count = length(local.config_backend.role_arns) > 0 ? 1 : 0

  name   = join("-", [local.name, "backend-assume"])
  policy = one(data.aws_iam_policy_document.backend.*.json)
}

resource "aws_iam_group_membership" "backend" {
  # checkov:skip=CKV2_AWS_14: Dynamic list of users.
  # checkov:skip=CKV2_AWS_21: Dynamic list of users.
  count = length(local.config_backend.role_arns) > 0 ? 1 : 0

  name  = join("-", [local.name, "backend-assume"])
  users = concat([aws_iam_user.this.name], [for user in local.config_users.arns : replace(user, "/^arn:aws:iam:.*:.*:user\\//", "")])

  group = one(aws_iam_group.backend.*.name)
}

resource "aws_iam_group_policy_attachment" "backend" {
  count = length(local.config_backend.role_arns) > 0 ? 1 : 0

  group      = one(aws_iam_group.backend.name)
  policy_arn = one(aws_iam_policy.backend.arn)
}
