#####################
### Grafana - SSO ###
#####################

# Manages a Key Vault Secret used to store the Azure service principal client ID used for Grafana OAuth.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_azuread_oauth_sp_client_id" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-sp-client-id"
  value        = var.grafana_secrets.sso_service_principal.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the Azure service principal password used for Grafana OAuth.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_azuread_oauth_sp_client_secret" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-sp-client-secret"
  value        = var.grafana_secrets.sso_service_principal.client_secret
  key_vault_id = var.argocd_keyvault_id
}

###############################
### Grafana - Admin Account ###
###############################

# Uses a random number generator to create a Grafana admin password.
#
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
#
resource "random_password" "grafana_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Manages a Key Vault Secret used to store the Grafana admin password.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_password" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-admin-password"
  value        = var.grafana_secrets.admin_password != null ? var.grafana_secrets.admin_password : random_password.grafana_admin_password.result
  key_vault_id = var.argocd_keyvault_id
}

##########################
### Grafana - Alerting ###
##########################

# Creates the webhook auth which are used for the templates
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_alert_template_auth" {
  for_each     = var.grafana_secrets.alert_templates
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-${each.key}-webhook-auth"
  value        = each.value.authorization_credentials
  key_vault_id = var.argocd_keyvault_id
}

# Creates the contact point details for the alerts to be sent out to
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_alert_contact_name" {
  for_each     = var.grafana_secrets.alert_contacts
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-${each.key}-name"
  value        = each.value.name
  key_vault_id = var.argocd_keyvault_id
}

# Creates the contact point details for the alerts to be sent out to
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "grafana_alert_contact_email" {
  for_each     = var.grafana_secrets.alert_contacts
  name         = "${module.azure_resource_names.key_vault_secret_name}-grafana-${each.key}-email"
  value        = each.value.email
  key_vault_id = var.argocd_keyvault_id
}
