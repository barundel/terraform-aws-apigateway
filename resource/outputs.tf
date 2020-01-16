output "resource_id" {
  value = concat(aws_api_gateway_resource.resource.*.id, [""])[0]
}

output "resource_path" {
  value = concat(aws_api_gateway_resource.resource.*.path, [""])[0]
}
