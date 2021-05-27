require 'spec_helper'
require 'json'
require 'pp'

describe 'Stream' do
  let(:stream_arn) { output_for(:harness, "stream_arn") }

  subject do
    kinesis(stream_arn)
  end

  it { should exist }
end