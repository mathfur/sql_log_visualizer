# -*- encoding: utf-8 -*-
require "spec_helper"

describe 'sql_log_visualizer command' do
  describe "with --version option" do
    it "output version number" do
      execute_command("--version").strip.should == '0.0.0'
    end
  end

  describe "with --target-file option" do
    it "output version number" do
      proc { execute_command("--target-file") }.should_not raise_error
    end
  end

  def execute_command(*args)
    args = [args].flatten
    stdout_string = nil
    IO.popen(["#{BASE_DIR}/bin/sql_log_visualizer"]+args, 'r+') do |io|
      stdout_string = io.read if io
    end
    stdout_string
  end
end
