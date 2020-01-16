resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.resource_rest_api_id
  parent_id   = var.resource_parent_id
  path_part   = var.resource_path_part
}