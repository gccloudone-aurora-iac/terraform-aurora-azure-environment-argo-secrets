###############################
### AlertManager - MS Teams ###
###############################

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_critical" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-critical"
  value        = var.alertmanager_secrets.msteams_connector.prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_major" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-major"
  value        = var.alertmanager_secrets.msteams_connector.prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_minor" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-minor"
  value        = var.alertmanager_secrets.msteams_connector.prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_critical" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-critical"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_major" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-major"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_minor" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-minor"
  value        = var.alertmanager_secrets.msteams_connector.non_prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_critical" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-critical"
  value        = var.alertmanager_secrets.msteams_connector.dev_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_major" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-major"
  value        = var.alertmanager_secrets.msteams_connector.dev_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_minor" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-minor"
  value        = var.alertmanager_secrets.msteams_connector.dev_minor
  key_vault_id = var.argocd_keyvault_id
}
