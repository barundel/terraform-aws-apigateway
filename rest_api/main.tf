resource "aws_api_gateway_rest_api" "api" {
  name = var.rest_api_name
  description = var.rest_api_description

  dynamic "endpoint_configuration" {
    for_each = var.rest_api_endpoint_configuration
    content {
      types = endpoint_configuration.value
    }
  }

  binary_media_types = var.binary_media_types
  minimum_compression_size = var.minimum_compression_size
  body = var.body
  policy = var.policy
  api_key_source = var.api_key_source
  tags = var.tags
}