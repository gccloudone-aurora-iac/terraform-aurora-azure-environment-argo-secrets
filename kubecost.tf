######################
### KubeCost - SSO ###
######################

# Manages a Key Vault Secret storing a Azure client ID of a service principal used for KubeCost authentication.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kubecost_sp_client_id" {
  count = var.kubecost_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-kubecost-sp-client-id"
  value        = var.kubecost_secrets.service_principal.client_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret storing the password of a service principal used for KubeCost authentication.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kubecost_sp_client_secret" {
  count = var.kubecost_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-kubecost-sp-client-secret"
  value        = var.kubecost_secrets.service_principal.client_secret
  key_vault_id = var.argocd_keyvault_id
}

################################
### KubeCost - Keys & Tokens ###
################################

# Manages a Key Vault Secret used to store the KubeCost token.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kubecost_token" {
  count = var.kubecost_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-kubecost-token"
  value        = var.kubecost_secrets.token
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the KubeCost product key.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kubecost_product_key" {
  count = var.kubecost_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-kubecost-product-key"
  value        = var.kubecost_secrets.product_key
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store the KubeCost cloud service key.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kubecost_cloud_service_key" {
  count = var.kubecost_secrets != null ? 1 : 0

  name         = "${module.azure_resource_names.key_vault_secret_name}-kubecost-cloud-service-key"
  value        = <<EOT
  {
    "subscriptionId": ${var.azure_secrets.subscription_id},
    "serviceKey": {
      "appId": ${var.kubecost_secrets.service_principal.client_id},
      "password": ${var.kubecost_secrets.service_principal.client_secret},
      "tenant": ${var.azure_secrets.tenant_id},
    }
  }
  EOT
  key_vault_id = var.argocd_keyvault_id
}
