# frozen_string_literal: true

class Reader
  attr_reader :log_data, :log_path

  def initialize(log_path)
    @log_path = log_path
    @log_data = Hash.new { |hash, key| hash[key] = [] }
  end


  def load
    build_log_data
  rescue Errno::ENOENT
    abort 'ERROR: file cannot be found or doesnt exist'
  end

  private

  # Grabs .log file and processes it into a Hash with url as key & [ips] as values
  def build_log_data
    File.readlines(@log_path).each do |line|
      next if line.chomp.empty?

      url, ip = line.chomp.split
      @log_data[url] << ip unless url.nil? || ip.nil?
    end
  end
end
