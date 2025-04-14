#################################
### Velero - AAD Pod Identity ###
#################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "velero_aadpodidentity_client_id" {
  name         = "${module.azure_resource_names.name}-velero-aadpodidentity-client-id"
  value        = var.velero_secrets.aad_pod_identity.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of the Azure resource ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "velero_aadpodidentity_resource_id" {
  name         = "${module.azure_resource_names.name}-velero-aadpodidentity-resource-id"
  value        = var.velero_secrets.aad_pod_identity.resource_id
  key_vault_id = var.argocd_keyvault_id
}

################################
### Velero - Storage Account ###
################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "velero_storage_account_name" {
  name         = "${module.azure_resource_names.name}-velero-sa-name"
  value        = var.velero_secrets.storage_account.name
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of the Azure resource ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "velero_storage_account_resource_group_name" {
  name         = "${module.azure_resource_names.name}-velero-sa-resource-group-name"
  value        = var.velero_secrets.storage_account.resource_group_name
  key_vault_id = var.argocd_keyvault_id
}
