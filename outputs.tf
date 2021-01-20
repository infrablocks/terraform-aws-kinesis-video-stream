output "kms_key_id" {
  value = aws_kms_key.stream_key.id
}

output "stream_id" {
  value = aws_kinesis_video_stream.stream.id
}


output "stream_arn" {
  value = aws_kinesis_video_stream.stream.arn
}

output "creation_time" {
  value = aws_kinesis_video_stream.stream.creation_time
}

output "stream_version" {
  value = aws_kinesis_video_stream.stream.version
}