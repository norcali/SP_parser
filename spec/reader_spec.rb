# frozen_string_literal: true

require 'spec_helper'
require 'reader'

RSpec.describe Reader do
  context 'when finding file' do
    let(:log_file_path) { 'spec/fixtures/test.log' }
    let(:reader) { Reader.new(log_file_path) }

    before { reader.load }

    it 'finds 7 urls' do
      expect(reader.log_data.count).to eq 7
    end

    it 'finds 17 visitors' do
      expect(reader.log_data.values.flatten.count).to eq 17
    end
  end

  context 'when NOT finding file' do
    let(:log_file_path) { 'spec/fixtures/wrong_test.log' }
    let(:reader) { Reader.new(log_file_path) }

    it 'raises an error' do
      expect( reader.load ).to raise_error(Errno::ENOENT)
    end
  end
end
