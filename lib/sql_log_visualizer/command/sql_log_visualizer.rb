# -*- encoding: utf-8 -*-

require 'getoptlong'
require 'fileutils'

usage = <<EOS
Usage: sql_log_visualizer [options]
-v, --version 
EOS
output_dir = "#{File.dirname(__FILE__)}/.."

opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--version', '-v', GetoptLong::NO_ARGUMENT],
  ['--watch', '-w', GetoptLong::NO_ARGUMENT],
  ['--barb-dir', '-b', GetoptLong::OPTIONAL_ARGUMENT],
  ['--rachis-dir', '-r', GetoptLong::OPTIONAL_ARGUMENT],
  ['--connection-file', '-c', GetoptLong::OPTIONAL_ARGUMENT],
  ['--output-file', '-o', GetoptLong::OPTIONAL_ARGUMENT]
)

manager = Apodidae::Manager.new
dealing_label = nil

begin
  opts.each do |opt, arg|
    case opt
    when '--help'; puts usage; exit
    when '--version'; puts Apodidae::VERSION; exit
    when '--watch'; puts 'before implementation.'; exit
    when '--barb-dir'
      manager.add_barb_from_file(arg)
    when '--rachis-dir'
      manager.add_rachis_from_file(arg)
    when '--connection-file'
      manager.set_connection_from_file(arg)
    when '--output-file'
      dealing_label, output_dir = arg.split(':')
    else
    end
  end
rescue
  puts ">>Exception"
  exit
end

manager.generate
manager.write_to(Apodidae::Edge.new(dealing_label) => output_dir)
