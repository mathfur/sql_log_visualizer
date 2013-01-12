# -*- encoding: utf-8 -*-

require 'getoptlong'

usage = <<EOS
Usage: sql_log_visualizer [options]
-v --version Display version information and exit.
EOS

opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--version', '-v', GetoptLong::NO_ARGUMENT],
)

begin
  opts.each do |opt, arg|
    case opt
    when '--help'; puts usage; exit
    when '--version'; puts SqlLogVisualizer::VERSION; exit
    end
  end
rescue
  puts "wrong option"
  exit
end
