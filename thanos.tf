#################################
### Thanos - AAD Pod Identity ###
#################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_aadpodidentity_client_id" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-aadpodidentity-client-id"
  value        = var.thanos_secrets.aad_pod_identity.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of the Azure resource ID of an user-assigned managed identity used for thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_aadpodidentity_resource_id" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-aadpodidentity-resource-id"
  value        = var.thanos_secrets.aad_pod_identity.resource_id
  key_vault_id = var.argocd_keyvault_id
}

################################
### Thanos - Storage Account ###
################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_storage_account_name" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-sa-name"
  value        = var.thanos_secrets.storage_account.name
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of the Azure resource ID of an user-assigned managed identity used for thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_storage_account_resource_group_name" {
  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-sa-resource-group-name"
  value        = var.thanos_secrets.storage_account.resource_group_name
  key_vault_id = var.argocd_keyvault_id
}
