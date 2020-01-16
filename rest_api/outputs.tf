output "rest_api_id" {
  //value = aws_api_gateway_rest_api.api.*.id[0]
  value = concat(aws_api_gateway_rest_api.api.*.id, [""])[0]
}

output "rest_api_root_resource_id" {
  value = concat(aws_api_gateway_rest_api.api.*.root_resource_id, [""])[0]
}

output "rest_api_created_date" {
  value = concat(aws_api_gateway_rest_api.api.*.created_date, [""])[0]
}

output "execution_arn" {
  value = concat(aws_api_gateway_rest_api.api.*.execution_arn, [""])[0]
}

output "arn" {
  value = concat(aws_api_gateway_rest_api.api.*.arn, [""])[0]
}