resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.rest_api_id
  parent_id   = var.resource_parent_id
  path_part   = var.resource_path_part
}

// aws_api_gateway_method
resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.rest_api_id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "GET"
  authorization = "NONE"
}

// aws_api_gateway_integration
resource "aws_api_gateway_integration" "intergration" {
  rest_api_id          = var.rest_api_id
  resource_id          = aws_api_gateway_resource.resource.id
  http_method          = aws_api_gateway_method.method.http_method
  type                 = "MOCK"

}

// aws_api_gateway_method_response

// aws_api_gateway_deployment
resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [aws_api_gateway_integration.intergration]

  rest_api_id = var.rest_api_id
  stage_name  = "test"

  variables = {
    "answer" = "42"
  }
}

// aws_api_gateway_method_settings
//resource "aws_api_gateway_method_settings" "method_settings" {
//  rest_api_id = var.rest_api_id
//  stage_name  = aws_api_gateway_stage.test.stage_name
//  method_path = "aws_api_gateway_resource.resource.path_part/aws_api_gateway_method.method.http_method"
//
//  settings {
//    metrics_enabled = true
//    logging_level   = "INFO"
//  }
//}

/// DO I NEED THESE IN HERE
resource "aws_api_gateway_stage" "test" {
  stage_name    = "prod"
  rest_api_id   = var.rest_api_id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

variable "rest_api_id" {
  default = ""
  description = "The ID of the associated REST API"
}

variable "resource_parent_id" {
  default = ""
  description = "The ID of the parent API resource"
}

variable "resource_path_part" {
  default = ""
  description = "The last path segment of this API resource"
}