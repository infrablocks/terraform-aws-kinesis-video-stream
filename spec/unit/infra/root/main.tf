module "stream" {
  source = "../../../.."

  region = var.region

  component = var.component
  deployment_identifier = var.deployment_identifier

  stream_name = var.stream_name

  retention = var.retention
  media_type = var.media_type

  tags = var.tags
}
