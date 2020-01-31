# terraform-aws-apigateway [![Build Status](https://github.com/barundel/terraform-aws-apigateway/workflows/build/badge.svg)](https://github.com/barundel/terraform-aws-apigateway/actions)

> **A Terraform module for creating API Gateway resources.**

## Table of Contents

- [Maintenance](#maintenance)
- [Getting Started](#getting-started)
- [License](#license)

## Maintenance

This project is maintained [Ben](https://github.com/barundel), anyone is welcome to contribute. 

## Getting Started

#### Multiple Sages
`count = length(var.resource_path_part) > 0 ? 1 : 0` Controls if to create new methods, need to detail this.

TODO: Example 

#### Complete Example

````
module "api_gateway" {
  source = "../../terraform-aws-apigateway/rest_api"

  rest_api_name = "API-Terraform-Test"
  rest_api_description = "Building API with terraform"
}

module "api_resource" {
  source = "../../terraform-aws-apigateway/resource"

  resource_rest_api_id = module.api_gateway.rest_api_id
  resource_parent_id = module.api_gateway.rest_api_root_resource_id

  resource_path_part = "api"

}

module "products_dev" {
  source = "../../terraform-aws-apigateway/method-config"
  rest_api_id = module.api_gateway.rest_api_id

  resource_parent_id = module.api_resource.resource_id
  resource_path_part = "products"

  authorization = "NONE"

  stage_name = "dev"

  http_method = "GET"
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:accountnumber:function:functionname/invocations"

  response_models = {
    "application/json" = "Empty"
  }


}

module "products_live" {
  source = "../../terraform-aws-apigateway/method-config"
  rest_api_id = module.api_gateway.rest_api_id

  resource_parent_id = module.api_resource.resource_id
  resource_id = module.products.resource_id
  authorization = "NONE"

  stage_name = "uat"

  http_method = "GET"
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:accountnnumber:function:functionname/invocations"

}
````

<!--- BEGIN_TF_DOCS --->
## Providers

No provider.

## Inputs

No input.

## Outputs

No output.
<!--- END_TF_DOCS --->

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.