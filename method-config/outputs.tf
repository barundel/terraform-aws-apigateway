output "resource_id" {
  value = concat(aws_api_gateway_resource.resource.*.id, [""])[0]
  description = "The resource's identifier"
}

output "resource_path_part" {
  value = concat(aws_api_gateway_resource.resource.*.path_part, [""])[0]
  description = "The complete path for this API resource, including all parent paths"
}

output "http_method" {
  value = concat(aws_api_gateway_method.method.*.http_method, [""])[0]
  description = "HTTP Method of the api gateway method"
}