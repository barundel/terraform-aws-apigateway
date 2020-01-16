variable "rest_api_name" {
  default = ""
  description = "The name of the REST API"
}

variable "rest_api_description" {
  default = ""
  description = "The description of the REST API"
}

variable "rest_api_endpoint_configuration" {
  default = {
    types = ["REGIONAL"]
  }
  type = any
  description = "Nested argument defining API endpoint configuration including endpoint type. Valid values: EDGE, REGIONAL or PRIVATE"
}

variable "binary_media_types" {
  default = []
  description = "The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
}

variable "minimum_compression_size" {
  default = "-1"
  description = "Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
}

variable "body" {
  default = ""
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API."
}

variable "policy" {
  default = ""
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform"
}

variable "api_key_source" {
  default = "HEADER"
  description = "The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
}

variable "tags" {
  default = {}
  description = "Key-value mapping of resource tags"
}