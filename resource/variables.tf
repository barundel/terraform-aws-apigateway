variable "resource_rest_api_id" {
  description = "The ID of the associated REST API"
  default = ""
}

variable "resource_parent_id" {
  default = null
  description = "The ID of the parent API resource"
}

variable "resource_path_part" {
  default = null
  description = "The last path segment of this API resource"
}