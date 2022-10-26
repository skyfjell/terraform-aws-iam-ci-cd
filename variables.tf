variable "labels" {
  description = "Labels Object"

  type = object({
    id = string
  })
}

variable "name" {
  description = "Terraform Username"
  default     = "tf-ci-cd"
  type        = string
}

variable "config_users" {
  description = "Additional User ARNs to Assume Role - !! Not recommended for production use !!"
  default     = {}

  type = object({
    enable = optional(bool, false)
    arns   = optional(list(string), [])
  })
}

variable "config_role" {
  description = "Configure TF User Role"

  type = object({
    enable_admin = optional(bool, false)
    policy_arn   = optional(string, null)
  })

  validation {
    condition     = var.config_role.enable_admin != false && var.config_role.policy_arn != null
    error_message = "Either set `var.config_role.enable_admin` to true, or provide `var.config_role.policy_arn`."
  }
}

variable "config_backend" {
  description = "Configure Backend for TF User"
  default     = {}

  type = object({
    role_arns = optional(list(string), [])
  })
}
