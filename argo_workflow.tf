###########################
### Argo Workflow - SSO ###
###########################

# Manages a Key Vault Secret used to store the Argo Workflow SSO service principal client ID
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argo_workflow_sso_client_id" {
  name         = "${module.azure_resource_prefixes.prefix}-argo-workflow-sp-client-id"
  value        = var.argo_workflow_secrets.sso_service_principal.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the Argo Workflow SSO service principal password
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argo_workflow_sso_client_secret" {
  name         = "${module.azure_resource_prefixes.prefix}-argo-workflow-sp-client-secret"
  value        = var.argo_workflow_secrets.sso_service_principal.client_secret
  key_vault_id = var.argocd_keyvault_id
}

#######################################
### Argo Workflow - Storage Account ###
#######################################

# Manages a Key Vault Secret used to store the Argo Workflow SSO service principal password
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argo_workflow_sa_name" {
  name         = "${module.azure_resource_prefixes.prefix}-argo-workflow-sa-name"
  value        = var.argo_workflow_secrets.storage_account.name
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the Argo Workflow SSO service principal password
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argo_workflow_sa_endpoint" {
  name         = "${module.azure_resource_prefixes.prefix}-argo-workflow-sa-endpoint"
  value        = var.argo_workflow_secrets.storage_account.endpoint
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the Argo Workflow SSO service principal password
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argo_workflow_sa_key" {
  name         = "${module.azure_resource_prefixes.prefix}-argo-workflow-sa-key"
  value        = var.argo_workflow_secrets.storage_account.key
  key_vault_id = var.argocd_keyvault_id
}
