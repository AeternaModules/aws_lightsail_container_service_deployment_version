output "lightsail_container_service_deployment_versions_id" {
  description = "Map of id values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lightsail_container_service_deployment_versions_container" {
  description = "Map of container values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.container if v.container != null && length(v.container) > 0 }
}
output "lightsail_container_service_deployment_versions_created_at" {
  description = "Map of created_at values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.created_at if v.created_at != null && length(v.created_at) > 0 }
}
output "lightsail_container_service_deployment_versions_public_endpoint" {
  description = "Map of public_endpoint values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.public_endpoint if v.public_endpoint != null && length(v.public_endpoint) > 0 }
}
output "lightsail_container_service_deployment_versions_region" {
  description = "Map of region values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lightsail_container_service_deployment_versions_service_name" {
  description = "Map of service_name values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.service_name if v.service_name != null && length(v.service_name) > 0 }
}
output "lightsail_container_service_deployment_versions_state" {
  description = "Map of state values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.state if v.state != null && length(v.state) > 0 }
}
output "lightsail_container_service_deployment_versions_version" {
  description = "Map of version values across all lightsail_container_service_deployment_versions, keyed the same as var.lightsail_container_service_deployment_versions"
  value       = { for k, v in aws_lightsail_container_service_deployment_version.lightsail_container_service_deployment_versions : k => v.version if v.version != null }
}

