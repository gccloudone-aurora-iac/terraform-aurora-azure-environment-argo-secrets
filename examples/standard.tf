#################
### Providers ###
#################

provider "azurerm" {
  features {}
}

#####################
### prerequisites ###
#####################

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "Canada Central"
}

resource "azurerm_key_vault" "example" {
  name                        = "examplekeyvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_user_assigned_identity" "cert_manager" {
  name                = "cert-manager-msi"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

variable "argocd_secrets" {
  description = "The secrets for the Argo CD component."
  type = object({
    helm_repositories = map(object({
      url      = string
      username = string
      password = string
    }))
    git_repositories = map(object({
      url      = string
      username = string
      password = string
    }))
  })
  default = {
    helm_repositories = {
      artifactory = {
        url      = "test"
        username = "test"
        password = "test"
      }
    }
    git_repositories = {
      gitlab = {
        url      = "test"
        username = "test"
        password = "test"
      }
    }
  }
  sensitive = true
}

output "test" {
  value = nonsensitive(var.argocd_secrets)
}


##############
### Module ###
##############

module "argocd_secrets" {
  source = "../"

  azure_resource_attributes = {
    project     = "aur"
    environment = "dev"
    location    = "Canada Central"
    instance    = 0
  }
  argocd_keyvault_id = azurerm_key_vault.example.id

  # secrets
  kubernetes_cluster = {
    server = "test"
    argocd_sa = {
      token  = "test"
      caData = "test"
    }
  }
  argocd_secrets = var.argocd_secrets
  argo_workflow_secrets = {
    sso_service_principal = {
      client_id     = "test"
      client_secret = "test"
    }
    storage_account = {
      name     = "test"
      endpoint = "test"
      key      = "test"
    }
  }
  azure_secrets = {
    tenant_id       = data.azurerm_client_config.current.tenant_id
    subscription_id = data.azurerm_client_config.current.subscription_id
  }
  cert_manager_secrets = {
    aad_pod_identity = {
      client_id   = "test"
      resource_id = "test"
    }
  }
  image_pull_secret = "test"
  loki_secrets = {
    username = "test"
    password = "test"
  }
  kiali_secrets = {
    grafana_token = "test"
  }
  kubecost_secrets = {
    service_principal = {
      client_id     = "test"
      client_secret = "test"
    }
    token       = "test"
    product_key = "test"
  }
  velero_secrets = {
    aad_pod_identity = {
      client_id   = "test"
      resource_id = "test"
    }
    storage_account = {
      name                = "test"
      resource_group_name = "test"
    }
  }
  grafana_secrets = {
    sso_service_principal = {
      client_id     = "test"
      client_secret = "test"
    }
  }
  alertmanager_secrets = {
    jira = {
      api_url  = "test"
      user     = "test"
      password = "test"
    }
    msteams_connector = {
      testing           = "test"
      prod_critical     = "test"
      prod_major        = "test"
      prod_minor        = "test"
      non_prod_critical = "test"
      non_prod_major    = "test"
      non_prod_minor    = "test"
      dev_critical      = "test"
      dev_major         = "test"
      dev_minor         = "test"
    }
    smtp = {
      smarthost = "test"
      username  = "test"
      password  = "test"
    }
  }
}
