# -*- encoding: utf-8 -*-

BASE_DIR = File.dirname(__FILE__) + '/..'
CONFIG_ROOT = "#{BASE_DIR}/config"

require 'getoptlong'
require 'fileutils'
require 'sinatra/base'
require 'sinatra/reloader'
require 'yaml'

require 'sql_log_visualizer/version'
require 'sql_log_visualizer/target_file'
require 'sql_log_visualizer/server'
require 'sql_log_visualizer/helper'
require 'sql_log_visualizer/table'
require 'sql_log_visualizer/edge'
