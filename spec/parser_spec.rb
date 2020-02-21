# frozen_string_literal: true

require 'spec_helper'
require 'reader'
require 'parser'

RSpec.describe Parser do
  context 'with proper log' do
    let(:log_file_path) { 'spec/fixtures/test.log' }
    let(:parser) { Parser.new(log_file_path) }

    it 'should find /home as the most visited' do
    end

    it '/home should have been visited 5 times' do
    end

    it 'should find /home as the most uniquely visited' do
    end

    it '/home should have been uniquely visited 4 times' do
    end

  end
end