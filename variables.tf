variable component {
}
variable deployment_identifier {
}
variable stream_name {
  default = "A name to identify the stream. "
}

variable retention {
  default = 10
  type = number
  description = "The number of hours that you want to retain the data in the stream"
}
variable media_type {
  description = "The media type of the stream."
  default = "video/h264"
}
variable region {
  default = "eu-west-2"
}

variable tags {
  type = map(string)
  description = "Additional resource tags"
  default = {}
}