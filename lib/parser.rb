# frozen_string_literal: true

PATH = File.expand_path('..', __dir__)

require_relative 'reader'
require 'json'

class Parser
  attr_reader :log_data, :file_path

  def initialize(file_path)
    reader = Reader.new(file_path)
    reader.load
    @file_path = file_path
    @log_data = reader.log_data
  end

  # Returns a JSON file with both unique and most visits to each url, sorted by most.
  # Made for easy read by humans
  def parse_for_humans
    # Cleanup of file_path, keeping only the name of the file
    filename = @file_path.split('/').last[0..-5]
    File.open("#{PATH}/json/#{filename}_for_humans.json", 'w') do |file|
      file.puts JSON.pretty_generate({ most_visits: visitors.to_h, most_unique_visits: unique_visitors.to_h })
    end
  end

  # Returns a JSON file with both unique and most visits to each url, sorted by most
  def run
    # Cleanup of file_path, keeping only the name of the file
    filename = @file_path.split('/').last
    File.open("#{PATH}/json/#{filename}.json", 'w') do |file|
      file.puts JSON.pretty_generate({ most_visits: visitors, most_unique_visits: unique_visitors })
    end
  end

  private

  # Returns an Array with the amount of unique IPs in each url, sorted by most
  def unique_visitors
    @log_data.map { |key, value| [key, "#{value.uniq.count} unique views"] }.sort_by(&:last).reverse
  end

  # Returns an Array with the amount of IPs in each url, sorted by most
  def visitors
    @log_data.map { |key, value| [key, "#{value.count} visits"] }.sort_by(&:last).reverse
  end
end

log_file_path = ARGV[0]

if log_file_path
  log = Parser.new(log_file_path)
  log.run
  log.parse_for_humans
else
  puts 'USAGE: ruby lib/parser.rb PATH_TO_LOG_FILE'
end
