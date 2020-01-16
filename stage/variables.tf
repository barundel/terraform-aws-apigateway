variable "resource_id" {
  default = ""
  description = "The API resource ID"
}

variable "resource_http_method" {
  default = ""
  description = "The HTTP method (GET, POST, PUT, DELETE, HEAD, OPTION, ANY) when calling the associated resource"
}

variable "integration_http_method" {
  default = ""
  description = "The integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g. Lambda function can only be invoked via POST."
}

variable "type" {
  default = ""
  description = "The integration input's type. Valid values are HTTP (for HTTP backends), MOCK (not calling any real backend), AWS (for AWS services), AWS_PROXY (for Lambda proxy integration) and HTTP_PROXY (for HTTP proxy integration). An HTTP or HTTP_PROXY integration with a connection_type of VPC_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC."
}

variable "connection_type" {
  default = ""
  description = "The integration input's connectionType. Valid values are INTERNET (default for connections through the public routable internet), and VPC_LINK (for private connections between API Gateway and a network load balancer in a VPC)."
}

variable "connection_id" {
  default = ""
  description = "The id of the VpcLink used for the integration. Required if connection_type is VPC_LINK"
}

variable "uri" {
  default = ""
  description = "The input's URI. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. For HTTP integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986 specification . For AWS integrations, the URI should be of the form arn:aws:apigateway:{region}:{subdomain.service|service}:{path|action}/{service_api}. region, subdomain and service are used to determine the right endpoint. e.g. arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:012345678901:function:my-func/invocations"
}

variable "credentials" {
  default = ""
  description = "The credentials required for the integration. For AWS integrations, 2 options are available. To specify an IAM Role for Amazon API Gateway to assume, use the role's ARN. To require that the caller's identity be passed through from the request, specify the string arn:aws:iam:::user."
}

variable "request_templates" {
  default = {}
  description = "A map of the integration's request templates."
}

variable "request_parameters" {
  default = {}
  description = "A map of request query string parameters and headers that should be passed to the backend responder. For example: request_parameters = { integration.request.header.X-Some-Other-Header = method.request.header.X-Some-Header }"
}

variable "passthrough_behavior" {
  default = ""
  description = "The integration passthrough behavior (WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER). Required if request_templates is used."
}

variable "cache_key_parameters" {
  default = []
  description = "A list of cache key parameters for the integration."
}

variable "cache_namespace" {
  default = ""
  description = "The integration's cache namespace."
}

variable "content_handling" {
  default = ""
  description = "Specifies how to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through."
}

variable "timeout_milliseconds" {
  default = "29,000"
  description = "Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds."
}




variable "rest_api_id" {
  default = ""
  description = "The ID of the associated REST API"
}

variable "stage_name" {
  default = ""
  description = "The name of the stage"
}

variable "deployment_description" {
  default = ""
  description = "The description of the deployment"
}

variable "deployment_variables" {
  default = {}
  description = "A map that defines variables for the stage"
}

variable "access_log_settings" {
  default = {}
  type = any
  description = "Enables access logs for the API stage"
}

variable "cache_cluster_enabled" {
  default = ""
  description = "Specifies whether a cache cluster is enabled for the stage"
}

variable "cache_cluster_size" {
  default = ""
  description = "The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237"
}

variable "client_certificate_id" {
  default = ""
  description = "The identifier of a client certificate for the stage"
}

variable "stage_description" {
  default = ""
  description = " The description of the stage"
}

variable "documentation_version" {
  default = ""
  description = "The version of the associated API documentation"
}

variable "stage_variables" {
  default = {}
  description = "A map that defines the stage variables"
}

variable "tags" {
  default = {}
  description = "A mapping of tags to assign to the resource"
}

variable "xray_tracing_enabled" {
  default = false
  description = "Whether active tracing with X-ray is enabled. Defaults to false"
}

variable "resource_method_rest_api_id" {
  default = ""
  description = "The ID of the associated REST AP"
}

variable "resource_method_resource_id" {
  default = null
  description = "The ID of the parent API resource"
}

variable "http_method" {
  default = ""
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
}

variable "authorization" {
  default = ""
  description = "The type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
}

variable "authorizer_id" {
  default = ""
  description = "The authorizer id to be used when the authorization is CUSTOM or COGNITO_USER_POOLS"
}

variable "authorization_scopes" {
  default = []
  description = "The authorization scopes used when the authorization is COGNITO_USER_POOLS"
}

variable "api_key_required" {
  default = null
  description = "Specify if the method requires an API key"
}

variable "request_models" {
  default = {}
  description = "A map of the API models used for the request's content type where key is the content type (e.g. application/json) and value is either Error, Empty (built-in models) or aws_api_gateway_model's name."
}

variable "request_validator_id" {
  default = ""
  description = "The ID of a aws_api_gateway_request_validator"
}

variable "int_request_parameters" {
  default = {}
  description = "A map of request parameters (from the path, query string and headers) that should be passed to the integration. The boolean value indicates whether the parameter is required (true) or optional (false). For example: request_parameters = {method.request.header.X-Some-Header = true method.request.querystring.some-query-param = true} would define that the header X-Some-Header and the query string some-query-param must be provided in the request."
}