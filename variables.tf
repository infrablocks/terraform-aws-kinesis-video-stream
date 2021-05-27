variable "region" {
  description = "The region into which to deploy the VPC."
  type = string
}

variable "component" {
  type = string
  description = "The name of the component for which this stream is being created."
}
variable "deployment_identifier" {
  description = "An identifier for this instantiation."
  type = string
}

variable "stream_name" {
  description = "A name to identify the stream. "
  type = string
}

variable "retention" {
  description = "The number of hours that for which to retain the data in the stream"
  default = 10
  type = number
}
variable "media_type" {
  description = "The media type of the stream."
  default = "video/h264"
}

variable "tags" {
  description = "Additional resource tags"
  type = map(string)
  default = {}
}
