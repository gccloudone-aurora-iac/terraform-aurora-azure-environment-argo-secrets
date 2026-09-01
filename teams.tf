###############################
### AlertManager - MS Teams ###
###############################

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_critical" {
  count = var.teams_secrets.prod_critical != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-critical"
  value        = var.teams_secrets.prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_major" {
  count = var.teams_secrets.prod_major != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-major"
  value        = var.teams_secrets.prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_prod_minor" {
  count = var.teams_secrets.prod_minor != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-prod-minor"
  value        = var.teams_secrets.prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_critical" {
  count = var.teams_secrets.non_prod_critical != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-critical"
  value        = var.teams_secrets.non_prod_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_major" {
  count = var.teams_secrets.non_prod_major != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-major"
  value        = var.teams_secrets.non_prod_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_non_prod_minor" {
  count = var.teams_secrets.non_prod_minor != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-non-prod-minor"
  value        = var.teams_secrets.non_prod_minor
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_critical" {
  count = var.teams_secrets.dev_critical != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-critical"
  value        = var.teams_secrets.dev_critical
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_major" {
  count = var.teams_secrets.dev_major != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-major"
  value        = var.teams_secrets.dev_major
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "teams_dev_minor" {
  count = var.teams_secrets.dev_minor != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-alertmanager-msteamsv2-dev-minor"
  value        = var.teams_secrets.dev_minor
  key_vault_id = var.argocd_keyvault_id
}
