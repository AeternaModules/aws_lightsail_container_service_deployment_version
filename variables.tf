variable "lightsail_container_service_deployment_versions" {
  description = <<EOT
Map of lightsail_container_service_deployment_versions, attributes below
Required:
    - service_name
    - container (block):
        - command (optional)
        - container_name (required)
        - environment (optional)
        - image (required)
        - ports (optional)
Optional:
    - region
    - public_endpoint (block):
        - container_name (required)
        - container_port (required)
        - health_check (required, block):
            - healthy_threshold (optional)
            - interval_seconds (optional)
            - path (optional)
            - success_codes (optional)
            - timeout_seconds (optional)
            - unhealthy_threshold (optional)
EOT

  type = map(object({
    service_name = string
    region       = optional(string)
    container = list(object({
      command        = optional(list(string))
      container_name = string
      environment    = optional(map(string))
      image          = string
      ports          = optional(map(string))
    }))
    public_endpoint = optional(object({
      container_name = string
      container_port = number
      health_check = object({
        healthy_threshold   = optional(number)
        interval_seconds    = optional(number)
        path                = optional(string)
        success_codes       = optional(string)
        timeout_seconds     = optional(number)
        unhealthy_threshold = optional(number)
      })
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lightsail_container_service_deployment_versions : (
        length(v.container) >= 1 && length(v.container) <= 53
      )
    ])
    error_message = "Each container list must contain between 1 and 53 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lightsail_container_service_deployment_versions : (
        alltrue([for item in v.container : (length(trimspace(item.container_name)) > 0)])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

