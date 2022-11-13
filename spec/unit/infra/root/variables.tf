variable "region" {}

variable "component" {}
variable "deployment_identifier" {}

variable "stream_name" {}

variable "retention" {
  default = null
}
variable "media_type" {
  default = null
}
variable "tags" {
  type = map(string)
  default = null
}