#######################################
### Cert-Manager - AAD Pod Identity ###
#######################################

# Manages a Key Vault Secret of the Azure client ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "certmanager_aadpodidentity_client_id" {
  name         = "${module.azure_resource_names.name}-certmanager-aadpodidentity-client-id"
  value        = var.cert_manager_secrets.aad_pod_identity.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret of the Azure resource ID of an user-assigned managed identity used for cert-manager.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "certmanager_aadpodidentity_resource_id" {
  name         = "${module.azure_resource_names.name}-certmanager-aadpodidentity-resource-id"
  value        = var.cert_manager_secrets.aad_pod_identity.resource_id
  key_vault_id = var.argocd_keyvault_id
}
