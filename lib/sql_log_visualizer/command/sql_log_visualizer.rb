# -*- encoding: utf-8 -*-

require 'getoptlong'
require 'fileutils'
require "sql_log_visualizer"

usage = <<EOS
Usage:
  sql_log_visualizer --target-file=sql.log

  then open http://localhost:4567/
EOS

opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--version', '-v', GetoptLong::NO_ARGUMENT],
  ['--target-file',  '-f',  GetoptLong::OPTIONAL_ARGUMENT]
)

target_file = nil

begin
  opts.each do |opt, arg|
    case opt
    when '--help'; puts usage; exit
    when '--version'; puts SqlLogVisualizer::VERSION; exit
    when '--target-file'
      target_file = arg
    end
  end
rescue
  puts "wrong option"
  exit
end

Server.run! :host => 'localhost', :port => 4567, :environment => :development, :target_file => target_file
