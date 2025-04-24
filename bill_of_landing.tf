#########################################
### Bill Of landing - Service Account ###
#########################################

# Manages a Key Vault Secret that stores the Kubernetes service account bearer token used by the Bill of Landing cron job
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "bill_of_landing_sa_bearer_token" {
  count = var.bill_of_landing != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-bill-of-landing-sa-bearer-token"
  value        = var.bill_of_landing.sa.token
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret that stores the Kubernetes service account bearer token used by the Bill of Landing cron job
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "bill_of_landing_sa_cacert" {
  count = var.bill_of_landing != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-bill-of-landing-sa-cacert"
  value        = var.bill_of_landing.sa.caData
  key_vault_id = var.argocd_keyvault_id
}
