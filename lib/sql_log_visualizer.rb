require 'getoptlong'
require 'fileutils'
require 'sinatra/base'

require 'sql_log_visualizer/version'
require 'sql_log_visualizer/server'
require 'sql_log_visualizer/helper'
require 'sql_log_visualizer/table'
require 'sql_log_visualizer/edge'

CONFIG_ROOT = File.dirname(__FILE__) + '/../config'
