locals {
  resource_id = coalescelist(aws_api_gateway_resource.resource.*.id, [var.resource_id])
}

resource "aws_api_gateway_resource" "resource" {
  count = length(var.resource_path_part) > 0 ? 1 : 0

  rest_api_id = var.rest_api_id
  parent_id   = var.resource_parent_id
  path_part   = var.resource_path_part
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.rest_api_id
  resource_id   = local.resource_id[0]

  http_method   = var.http_method
  authorization = var.authorization

  authorization_scopes = var.authorization_scopes
  authorizer_id = var.authorizer_id

  api_key_required = var.api_key_required
  request_models = var.request_models

  request_validator_id = var.request_validator_id
  request_parameters = var.request_models
}

resource "aws_api_gateway_method_response" "method_response" {
  http_method = var.http_method
  resource_id = local.resource_id[0]
  rest_api_id = var.rest_api_id
  status_code = var.method_reseponse_status_code

  response_parameters = var.response_parameters
  response_models = var.response_models

}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = var.rest_api_id
  stage_name  = var.stage_name

  variables = var.deployment_variables
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.rest_api_id
  resource_id             = local.resource_id[0]
  http_method             = var.http_method
  integration_http_method = var.integration_http_method
  type                    = var.type
  uri                     = var.uri
}

resource "aws_api_gateway_integration_response" "integration_response" {
  rest_api_id             = var.rest_api_id
  resource_id             = local.resource_id[0]
  http_method             = var.http_method
  status_code = var.method_reseponse_status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/xml" = <<EOF
#set($inputRoot = $input.path('$'))
<?xml version="1.0" encoding="UTF-8"?>
<message>
    $inputRoot.body
</message>
EOF
  }
}