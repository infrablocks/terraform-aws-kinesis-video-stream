module "stream" {
  # This makes absolutely no sense. I think there's a bug in terraform.
  source = "./../../../../../../../"

  region = var.region

  component = var.component
  deployment_identifier = var.deployment_identifier

  stream_name = var.stream_name
}
