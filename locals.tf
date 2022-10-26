locals {
  labels = var.labels
  name   = join("-", compact([local.labels.id, var.name]))

  config_users = merge(
    var.config_users,
    # Only merge in users if explicitly enabled.
    { arns = var.config_users.enable ? var.config_users.arns : [] }
  )

  config_role = var.config_role

  config_backend = var.config_backend
}
