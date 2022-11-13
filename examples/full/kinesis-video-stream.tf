module "stream" {
  source = "../../"

  region = var.region

  component = var.component
  deployment_identifier = var.deployment_identifier

  stream_name = var.stream_name

  retention = 15
  media_type = "video/mp4"

  tags = {
    Example: "full"
  }
}
