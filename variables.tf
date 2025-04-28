variable "azure_resource_attributes" {
  description = "Attributes used to describe Azure resources"
  type = object({
    department_code = string
    owner           = string
    project         = string
    environment     = string
    location        = optional(string, "Canada Central")
    instance        = number
  })
  nullable = false
}

variable "user_defined" {
  description = "A user-defined field that describes the Azure resource."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.user_defined) >= 2 && length(var.user_defined) <= 15
    error_message = "The user-defined field must be between 2-15 characters long."
  }
}

variable "naming_convention" {
  type        = string
  default     = "oss"
  description = "Sets which naming convention to use. Accepted values: oss, gc"
  validation {
    condition     = var.naming_convention == "oss" || var.naming_convention == "gc"
    error_message = "The naming_convention field must either be 'oss' or 'gc'."
  }
}

variable "argocd_keyvault_id" {
  description = "The Azure resource ID of the Azure Key Vault which contains the ArgoCD secrets."
  type        = string
}

variable "load_balancer_subnet_name" {
  description = "The Azure load balancer subnet name"
  type        = string
  default     = "loadbalancer"
}

###############
### Secrets ###
###############

variable "kubernetes_cluster" {
  description = "The secrets related to the Kubernetes cluster."
  type = object({
    server = string
    argocd_sa = object({
      token  = string
      caData = string
    })
  })
  sensitive = true
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
    helm_repositories = {}
    git_repositories  = {}
  }
  sensitive = true
}

variable "argo_workflow_secrets" {
  description = "The secrets for the Argo Workflows component."
  type = object({
    sso_service_principal = object({
      client_id     = string
      client_secret = string
    })
    storage_account = object({
      name     = string
      endpoint = string
      key      = string
    })
  })
  sensitive = true
}

variable "azure_secrets" {
  description = "The Azure related secrets."
  type = object({
    tenant_id       = string
    subscription_id = string
  })
}

variable "bill_of_landing" {
  description = "The secrets related to the Bill of Landing."
  type = object({
    sa = object({
      token  = string
      caData = string
    })
  })
  sensitive = true
  default   = null
}

variable "cert_manager_secrets" {
  description = "The secrets for the Cert-Manager component."
  type = object({
    aad_pod_identity = object({
      client_id   = string
      resource_id = string
    })
  })
}

variable "image_pull_secret" {
  description = "The image pull secret for the cluster. The value should be the .dockerconfigjson. The value is non-automated. It may be best to input them manually."
  type        = string
  default     = null
  sensitive   = true
}

variable "kiali_secrets" {
  description = "The non-automated secrets for the Kiali component. It may be best to input them manually."
  type = object({
    grafana_token = string
  })
  default   = null
  sensitive = true
}

variable "kubecost_secrets" {
  description = "The non-automated secrets for the Kubecost component. It may be best to input them manually."
  type = object({
    service_principal = object({
      client_id     = string
      client_secret = string
    })
    token       = string
    product_key = string
  })
  default   = null
  sensitive = true
}

variable "velero_secrets" {
  description = "The secrets for the Velero component."
  type = object({
    aad_pod_identity = object({
      client_id   = string
      resource_id = string
    })
    storage_account = object({
      name                = string
      resource_group_name = string
    })
  })
}

variable "loki_secrets" {
  description = "The secrets for the Loki component."
  type = object({
    username = optional(string, "loki-ingest")
    password = optional(string)
  })
  default = {
    username = "loki-ingest"
    password = null
  }
  sensitive = true
}

variable "grafana_secrets" {
  description = "The secrets for the Grafana component."
  type = object({
    admin_password = optional(string)
    sso_service_principal = object({
      client_id     = string
      client_secret = string
    })
  })
  sensitive = true
}

variable "alertmanager_secrets" {
  description = "The secrets for the Alertmanager component."
  type = object({
    jira = object({
      api_url  = string
      user     = string
      password = string
    })
    msteams_connector = object({
      testing           = string
      prod_critical     = string
      prod_major        = string
      prod_minor        = string
      non_prod_critical = string
      non_prod_major    = string
      non_prod_minor    = string
      dev_critical      = string
      dev_major         = string
      dev_minor         = string
    })
    smtp = object({
      smarthost = string
      username  = string
      password  = string
    })
  })
  default   = null
  sensitive = true
}
