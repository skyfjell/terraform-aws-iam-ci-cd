resource "aws_iam_user" "this" {
  name = local.name
}

resource "aws_iam_group" "this" {
  name = local.name
  path = "/"
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = compact(concat([aws_iam_user.this.arn], local.config_users.arns))
    }
  }
}

resource "aws_iam_role" "this" {
  assume_role_policy = data.aws_iam_policy_document.this.json
  name               = local.name
}

resource "aws_iam_role_policy_attachment" "this" {
  role = aws_iam_role.this.name
  policy_arn = (
    local.config_role.enable_admin == true && local.config_role.policy_arn == null
    ? "arn:aws:iam::aws:policy/AdministratorAccess"
    : local.config_role.policy
  )
}
