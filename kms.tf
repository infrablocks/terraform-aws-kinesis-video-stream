resource "aws_kms_key" "stream_key" {
  description = "${var.component}-${var.deployment_identifier}-${var.stream_name}-kms-key"
}
