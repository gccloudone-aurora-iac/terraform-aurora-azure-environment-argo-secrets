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

###########################
### AlertManager - Jira ###
###########################

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_jira_api_url" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-jira-api-url"
  value        = var.alertmanager_secrets.jira.api_url
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_jira_user" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-jira-user"
  value        = var.alertmanager_secrets.jira.user
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_jira_password" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-jira-password"
  value        = var.alertmanager_secrets.jira.password
  key_vault_id = var.argocd_keyvault_id
}

###############################
### AlertManager - MS Teams ###
###############################

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_testing" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-testing"
  value        = var.alertmanager_secrets.msteams_connector.testing
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_prod_critical" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-prod-critical"
  value        = var.alertmanager_secrets.msteams_connector.prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_prod_major" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-prod-major"
  value        = var.alertmanager_secrets.msteams_connector.prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_prod_minor" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-prod-minor"
  value        = var.alertmanager_secrets.msteams_connector.prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_non_prod_critical" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-non-prod-critical"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_non_prod_major" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-non-prod-major"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_non_prod_minor" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-non-prod-minor"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_dev_critical" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-dev-critical"
  value        = var.alertmanager_secrets.msteams_connector.dev_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_dev_major" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-dev-major"
  value        = var.alertmanager_secrets.msteams_connector.dev_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_msteams_dev_minor" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-msteams-connector-dev-minor"
  value        = var.alertmanager_secrets.msteams_connector.dev_minor
  key_vault_id = var.argocd_keyvault_id
}

###########################
### AlertManager - SMTP ###
###########################

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_smtp_smarthost" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-smtp-smarthost"
  value        = var.alertmanager_secrets.smtp.smarthost
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_smtp_username" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-smtp-username"
  value        = var.alertmanager_secrets.smtp.username
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "alertmanager_notifications_smtp_password" {
  count = var.alertmanager_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-notifications-smtp-password"
  value        = var.alertmanager_secrets.smtp.password
  key_vault_id = var.argocd_keyvault_id
}
