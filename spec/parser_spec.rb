# frozen_string_literal: true

PATH = File.expand_path('..', __dir__)
require 'spec_helper'
require 'reader'
require 'parser'

RSpec.describe Parser do
  context 'with proper log' do
    let(:log_file_path) { 'spec/fixtures/test.log' }
    let(:parser) { Parser.new(log_file_path) }

    it 'should find /home as the most visited' do
      expect(parser.send(:visitors).first.first).to eq('/home')
    end

    it '/home should have been visited 5 times' do
      expect(parser.send(:visitors).first.last).to eq('5 visits')
    end

    it 'should find /home as the most uniquely visited' do
      expect(parser.send(:unique_visitors).first.first).to eq('/home')
    end

    it '/home should have been uniquely visited 4 times' do
      expect(parser.send(:unique_visitors).first.last).to eq('4 unique views')
    end

    before { parser.run }

    it 'should create the json file' do
      expect(File).to exist("#{PATH}/spec/fixtures/test.log.json")
    end

    before { parser.parse_for_humans }

    it 'should create the json file' do
      expect(File).to exist("#{PATH}/for_humans.json")
    end

  end
end