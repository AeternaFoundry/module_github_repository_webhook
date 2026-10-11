variable "repository_webhooks" {
  description = <<EOT
Map of repository_webhooks, attributes below
Required:
    - events
    - repository
Optional:
    - active
    - etag
    - configuration (block):
        - content_type (optional)
        - insecure_ssl (optional)
        - secret (optional)
        - url (required)
EOT

  type = map(object({
    events     = set(string)
    repository = string
    active     = optional(bool)
    etag       = optional(string)
    configuration = optional(object({
      content_type = optional(string)
      insecure_ssl = optional(bool)
      secret       = optional(string)
      url          = string
    }))
  }))
}

