output "resource_id" {
  value = concat(aws_api_gateway_resource.resource.*.id, [""])[0]
}

output "http_method" {
  value = concat(aws_api_gateway_method.method.*.http_method, [""])[0]
}