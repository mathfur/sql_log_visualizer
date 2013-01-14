# -*- encoding: utf-8 -*-

require 'spec_helper'

describe TargetFile do
  describe "when the target file does not exist" do
    specify do
      proc { TargetFile.new("noexist").gets }.should raise_error
    end
  end

  describe "when the target file exist" do
    before do
      @tempfile = Tempfile.new('foo')
      @tempfile.write 'foo'
      @tempfile.close
    end

    specify do
      TargetFile.new(@tempfile.path).gets.should == "foo"
    end

    specify do
      TargetFile.new(@tempfile.path).gets.should == "foo"
      @tempfile.open
      @tempfile.write "bar\nbaz"
      @tempfile.close
      TargetFile.new(@tempfile.path).gets.should == "bar\nbaz"
    end
  end
end
