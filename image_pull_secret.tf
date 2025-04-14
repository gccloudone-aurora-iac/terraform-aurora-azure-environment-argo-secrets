#########################
### Image Pull Secret ###
#########################

# Manages a Key Vault Secret.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "cnp_controller_image_pull_secret" {
  count = var.image_pull_secret != null ? 1 : 0

  name         = "${module.azure_resource_names.name}-image-pull-secret"
  value        = var.image_pull_secret
  key_vault_id = var.argocd_keyvault_id
}
