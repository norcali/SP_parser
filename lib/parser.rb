# frozen_string_literal: true

PATH = File.expand_path('..', __dir__)
require_relative 'reader'
require 'json'

class Parser
  attr_reader :log_data, :file_path

  def initialize(file_path)
  end

  def parse_for_humans
  end

  def run
  end

  private

  def unique_visitors
  end

  def visitors
  end
end
