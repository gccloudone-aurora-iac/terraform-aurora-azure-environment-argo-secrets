# Manages a Key Vault Secret used to store Azure subscription ID that the environment resides in.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "azure_subscription_id" {
  name         = "${module.azure_resource_prefixes.prefix}-subscription-id"
  value        = var.azure_secrets.subscription_id
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret used to store Azure tenant ID that the environment resides in.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "azure_tenant_id" {
  name         = "${module.azure_resource_prefixes.prefix}-tenant-id"
  value        = var.azure_secrets.tenant_id
  key_vault_id = var.argocd_keyvault_id
}

##################
### Networking ###
##################

# Manages a Key Vault Secret that stores the Kubernetes clusters load balancer subnet name.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "load_balancer_subnet_name" {
  name         = "${module.azure_resource_prefixes.prefix}-load-balancer-subnet-name"
  value        = "loadbalancer"
  key_vault_id = var.argocd_keyvault_id
}

###################
### AKS Cluster ###
###################

# Manages a Key Vault Secret that stores the Kubernetes cluster's server FQDN.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "cluster_server" {
  name         = "${module.azure_resource_prefixes.prefix}-server"
  value        = var.kubernetes_cluster.server
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret that stores the Kubernetes service account bearer token used to register a cluster in Argo CD.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argocd_cluster_sa_bearer_token" {
  name         = "${module.azure_resource_prefixes.prefix}-argocd-sa-bearer-token"
  value        = var.kubernetes_cluster.argocd_sa.token
  key_vault_id = var.argocd_keyvault_id
}

# Manages a Key Vault Secret that stores the Kubernetes service account caData used to register a cluster in Argo CD.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
#
resource "azurerm_key_vault_secret" "argocd_cluster_sa_cacert" {
  name         = "${module.azure_resource_prefixes.prefix}-argocd-sa-cacert"
  value        = var.kubernetes_cluster.argocd_sa.caData
  key_vault_id = var.argocd_keyvault_id
}
