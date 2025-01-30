#############################
### Kiali - Grafana Token ###
#############################

# The Grafana token Kiali uses. The role of the token should be "Viewer".
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "kiali_grafana_token" {
  count = var.kiali_secrets != null ? 1 : 0

  name         = "${module.azure_resource_prefixes.prefix}-kiali-grafana-token"
  value        = var.kiali_secrets.grafana_token
  key_vault_id = var.argocd_keyvault_id
}
