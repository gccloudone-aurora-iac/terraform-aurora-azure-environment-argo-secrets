##################################
### Thanos - Workload Identity ###
##################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for Thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_identity_client_id" {
  count = var.thanos_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-workloadidentity-client-id"
  value        = var.thanos_secrets.identity_client_id
  key_vault_id = var.argocd_keyvault_id
}


##################################
### Thanos - Storage Account   ###
##################################

# Manages a Key Vault Secret of the storage account name used for thanos.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "thanos_storage_account_name" {
  count = var.thanos_secrets != null ? 1 : 0
  name         = "${module.azure_resource_names.key_vault_secret_name}-thanos-sa-name"
  value        = var.thanos_secrets.storage_account_name
  key_vault_id = var.argocd_keyvault_id
}
