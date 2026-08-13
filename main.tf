resource "aws_lightsail_container_service_deployment_version" "lightsail_container_service_deployment_versions" {
  for_each = var.lightsail_container_service_deployment_versions

  service_name = each.value.service_name
  region       = each.value.region

  dynamic "container" {
    for_each = each.value.container
    content {
      command        = container.value.command
      container_name = container.value.container_name
      environment    = container.value.environment
      image          = container.value.image
      ports          = container.value.ports
    }
  }

  dynamic "public_endpoint" {
    for_each = each.value.public_endpoint != null ? [each.value.public_endpoint] : []
    content {
      container_name = public_endpoint.value.container_name
      container_port = public_endpoint.value.container_port
      health_check {
        healthy_threshold   = public_endpoint.value.health_check.healthy_threshold
        interval_seconds    = public_endpoint.value.health_check.interval_seconds
        path                = public_endpoint.value.health_check.path
        success_codes       = public_endpoint.value.health_check.success_codes
        timeout_seconds     = public_endpoint.value.health_check.timeout_seconds
        unhealthy_threshold = public_endpoint.value.health_check.unhealthy_threshold
      }
    }
  }
}

