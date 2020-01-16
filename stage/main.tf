resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.resource_method_rest_api_id
  resource_id   = var.resource_method_resource_id

  http_method   = var.http_method
  authorization = var.authorization

  authorization_scopes = var.authorization_scopes
  authorizer_id = var.authorizer_id

  api_key_required = var.api_key_required
  request_models = var.request_models

  request_validator_id = var.request_validator_id
  request_parameters = var.request_models
}

resource "aws_api_gateway_deployment" "deployment" {

  rest_api_id = var.rest_api_id
  stage_name  = var.stage_name

  variables = var.deployment_variables
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.rest_api_id
  resource_id             = var.resource_id
  http_method             = var.http_method
  integration_http_method = var.integration_http_method
  type                    = var.type
  uri                     = var.uri
}

//resource "aws_api_gateway_stage" "stage" {
//  stage_name    = var.stage_name
//  rest_api_id   = var.rest_api_id
//  deployment_id = aws_api_gateway_deployment.deployment.id
//
//  dynamic "access_log_settings" {
//    for_each = var.access_log_settings
//    content {
//      destination_arn = lookup(access_log_settings.value, "destination_arn", null)
//      format = lookup(access_log_settings.value, "format", null)
//    }
//  }
//
//}




