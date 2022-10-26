# Terraform AWS IAM CI/CD Module

Terraform module to create and configure an AWS user, group, and role for management of AWS resources with Terraform via CI/CD.

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0, < 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_policy_document.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_backend"></a> [config\_backend](#input\_config\_backend) | Configure Backend for TF User | <pre>object({<br>    role_arns = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_config_role"></a> [config\_role](#input\_config\_role) | Configure TF User Role | <pre>object({<br>    enable_admin = optional(bool, false)<br>    policy_arn   = optional(string, null)<br>  })</pre> | n/a | yes |
| <a name="input_config_users"></a> [config\_users](#input\_config\_users) | Additional User ARNs to Assume Role - !! Not recommended for production use !! | <pre>object({<br>    enable = optional(bool, false)<br>    arns   = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels Object | <pre>object({<br>    id = string<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Terraform Username | `string` | `"tf-ci-cd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
