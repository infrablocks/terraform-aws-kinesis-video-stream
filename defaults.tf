locals {
  # default for cases when `null` value provided, meaning "use default"
  retention  = var.retention == null ? 10 : var.retention
  media_type = var.media_type == null ? "video/h264" : var.media_type
  tags       = var.tags == null ? {} : var.tags
}
