resource "aws_kinesis_video_stream" "stream" {
  name                    =  var.stream_name
  data_retention_in_hours =  local.retention
  media_type              =  local.media_type
  kms_key_id              =  aws_kms_key.stream_key.id
  
  tags = merge(local.resolved_tags, {
    Name        = "${var.component}-${var.deployment_identifier}-${var.stream_name}"
  })
}