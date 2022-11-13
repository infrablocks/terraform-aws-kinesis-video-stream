# frozen_string_literal: true

require 'spec_helper'

describe 'full' do
  let(:stream_arn) do
    output(role: :full, name: 'stream_arn')
  end
  let(:stream_name) do
    output(role: :full, name: 'stream_name')
  end

  before(:context) do
    apply(role: :full)
  end

  after(:context) do
    destroy(
      role: :full,
      only_if: -> { !ENV['FORCE_DESTROY'].nil? || ENV['SEED'].nil? }
    )
  end

  describe 'stream' do
    subject(:stream_info) do
      kinesisvideo_client.describe_stream(stream_arn:).stream_info
    end

    let(:kinesisvideo_client) do
      Aws::KinesisVideo::Client.new
    end

    it 'exists' do
      expect(stream_info.stream_name).to(eq(stream_name))
    end
  end
end
