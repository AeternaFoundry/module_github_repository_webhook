resource "github_repository_webhook" "repository_webhooks" {
  for_each = var.repository_webhooks

  events     = each.value.events
  repository = each.value.repository
  active     = each.value.active
  etag       = each.value.etag

  dynamic "configuration" {
    for_each = each.value.configuration != null ? [each.value.configuration] : []
    content {
      content_type = configuration.value.content_type
      insecure_ssl = configuration.value.insecure_ssl
      secret       = configuration.value.secret
      url          = configuration.value.url
    }
  }
}

