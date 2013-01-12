require "rubygems"

require 'rack/test'
require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start

BASE_DIR = "#{File.dirname(__FILE__)}/.."

require './lib/sql_log_visualizer'

module TestServer
  def app
    Server
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include TestServer
end
