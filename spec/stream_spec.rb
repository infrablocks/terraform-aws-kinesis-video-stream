require 'spec_helper'
require 'json'
require 'pp'

describe 'Stream' do
  let(:kinesisvideo_client) { Aws::KinesisVideo::Client.new }

  let(:stream_arn) { output_for(:harness, "stream_arn") }
  let(:stream_name) { output_for(:harness, "stream_name") }

  subject do
    kinesisvideo_client.describe_stream(stream_arn: stream_arn).stream_info
  end

  it "exists" do
    expect(subject.stream_name).to(eq(stream_name))
  end
end