################################
### ArgoCD - Helm Repository ###
################################

resource "azurerm_key_vault_secret" "argocd_helm_repository_url" {
  for_each = nonsensitive(var.argocd_secrets.helm_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-helm-repository-url"
  value        = var.argocd_secrets.helm_repositories[each.key].url
  key_vault_id = var.argocd_keyvault_id
}

resource "azurerm_key_vault_secret" "argocd_helm_repository_username" {
  for_each = nonsensitive(var.argocd_secrets.helm_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-helm-repository-username"
  value        = var.argocd_secrets.helm_repositories[each.key].username
  key_vault_id = var.argocd_keyvault_id
}

resource "azurerm_key_vault_secret" "argocd_helm_repository_password" {
  for_each = nonsensitive(var.argocd_secrets.helm_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-helm-repository-password"
  value        = var.argocd_secrets.helm_repositories[each.key].password
  key_vault_id = var.argocd_keyvault_id
}

###############################
### ArgoCD - Git Repository ###
###############################

resource "azurerm_key_vault_secret" "argocd_git_repository_url" {
  for_each = nonsensitive(var.argocd_secrets.git_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-git-repository-url"
  value        = var.argocd_secrets.git_repositories[each.key].url
  key_vault_id = var.argocd_keyvault_id
}

resource "azurerm_key_vault_secret" "argocd_git_repository_username" {
  for_each = nonsensitive(var.argocd_secrets.git_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-git-repository-username"
  value        = var.argocd_secrets.git_repositories[each.key].username
  key_vault_id = var.argocd_keyvault_id
}

resource "azurerm_key_vault_secret" "argocd_git_repository_password" {
  for_each = nonsensitive(var.argocd_secrets.git_repositories)

  name         = "${module.azure_resource_prefixes.prefix}-argocd-${each.key}-git-repository-password"
  value        = var.argocd_secrets.git_repositories[each.key].password
  key_vault_id = var.argocd_keyvault_id
}
