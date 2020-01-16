module "api_gateway" {
  source = "../../rest_api"

  rest_api_name = "API-Terraform-Test"
  rest_api_description = "Building API with terraform"
}


module "api_resource" {
  source = "../../resource"

  resource_rest_api_id = module.api_gateway.rest_api_id
  resource_parent_id = module.api_gateway.rest_api_root_resource_id

  resource_path_part = "api"

}

module "products_resource" {
  source = "../../resource"

  resource_rest_api_id = module.api_gateway.rest_api_id
  resource_parent_id = module.api_resource.resource_id

  resource_path_part = "products"

}

module "the_deploy" {
  source = "../../method_settings"
  rest_api_id = module.api_gateway.rest_api_id
  resource_parent_id = module.api_resource.resource_id
  resource_path_part = "benatest"
}