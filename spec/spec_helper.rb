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

RSpec::Matchers.define :be_equal_ignoring_spaces do |expect|
  match do |actual|
    @expect, @actual = [expect, actual].map do |e|
      e.gsub(/^\s*/, '').gsub(/\s*$/, '').gsub(/ +/, ' ')
    end
    @expect == @actual
  end

  failure_message_for_should do |actual|
    [
      "actual: #{@actual.inspect}",
      "expect: #{@expect.inspect}",
    ].join("\n")
  end
end
