# frozen_string_literal: true

require 'spec_helper'
require 'json'

describe 'stream' do
  let(:region) do
    var(role: :root, name: 'region')
  end
  let(:component) do
    var(role: :root, name: 'component')
  end
  let(:deployment_identifier) do
    var(role: :root, name: 'deployment_identifier')
  end
  let(:stream_name) do
    var(role: :root, name: 'stream_name')
  end

  describe 'by default' do
    before(:context) do
      @plan = plan(role: :root)
    end

    it 'creates a kinesis video stream' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .once)
    end

    it 'uses the provided stream name' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(:name, stream_name))
    end

    it 'uses a data retention of 10 hours' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(:data_retention_in_hours, 10))
    end

    it 'uses a media type of "video/h264"' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(:media_type, 'video/h264'))
    end

    it 'includes component and deployment identifier as tags' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(
                :tags,
                a_hash_including(
                  Component: component,
                  DeploymentIdentifier: deployment_identifier
                )
              ))
    end

    it 'adds a name tag' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(
                :tags,
                a_hash_including(
                  Name: "#{component}-#{deployment_identifier}-#{stream_name}"
                )
              ))
    end
  end

  describe 'when retention provided' do
    before(:context) do
      @plan = plan(role: :root) do |vars|
        vars.retention = 20
      end
    end

    it 'uses the provided data retention' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(:data_retention_in_hours, 20))
    end
  end

  describe 'when media type provided' do
    before(:context) do
      @plan = plan(role: :root) do |vars|
        vars.media_type = 'video/mp4'
      end
    end

    it 'uses the provided data retention' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(:media_type, 'video/mp4'))
    end
  end

  describe 'when tags provided' do
    before(:context) do
      @plan = plan(role: :root) do |vars|
        vars.tags = {
          Important: 'tag',
          Other: 'thing'
        }
      end
    end

    it 'includes component and deployment identifier as tags' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(
                :tags,
                a_hash_including(
                  Component: component,
                  DeploymentIdentifier: deployment_identifier
                )
              ))
    end

    it 'adds a name tag' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(
                :tags,
                a_hash_including(
                  Name: "#{component}-#{deployment_identifier}-#{stream_name}"
                )
              ))
    end

    it 'adds the provided tags' do
      expect(@plan)
        .to(include_resource_creation(type: 'aws_kinesis_video_stream')
              .with_attribute_value(
                :tags,
                a_hash_including(
                  Important: 'tag',
                  Other: 'thing'
                )
              ))
    end
  end
end
