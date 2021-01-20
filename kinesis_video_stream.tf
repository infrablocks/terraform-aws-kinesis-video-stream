resource "aws_kinesis_video_stream" "stream" {
  name                    =  var.stream_name
  data_retention_in_hours =  var.retention
  media_type              =  var.media_type 
  kms_key_id              =  aws_kms_key.stream_key.id
  
  tags = merge(local.tags, {
    Name        = "${var.component}-${var.deployment_identifier}-${var.stream_name}"
  })

}