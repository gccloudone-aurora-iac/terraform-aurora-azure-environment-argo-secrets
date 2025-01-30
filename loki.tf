##########################
### Loki User ###
##########################
# This user shall be used by FluentD & Kubernetes Event Exporter

# Manages a Key Vault Secret of the username used to send logs to Loki.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "loki_user" {
  name         = "${module.azure_resource_prefixes.prefix}-loki-user"
  value        = var.loki_secrets.username
  key_vault_id = var.argocd_keyvault_id
}

# Creates an Loki password using a cryptographic random number generator.
#
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
#
resource "random_password" "loki_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Manages a Key Vault Secret of a password of a Loki user used to send logs to Loki.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "loki_password" {
  name         = "${module.azure_resource_prefixes.prefix}-loki-password"
  value        = var.loki_secrets.password != null ? var.loki_secrets.password : random_password.loki_password.result
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of an Authorization header value for Loki used for Basic access authentication.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "loki_authorization" {
  name         = "${module.azure_resource_prefixes.prefix}-loki-authorization"
  value        = "Basic ${base64encode("${azurerm_key_vault_secret.loki_user.value}:${azurerm_key_vault_secret.loki_password.value}")}"
  key_vault_id = var.argocd_keyvault_id
}
