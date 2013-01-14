# -*- encoding: utf-8 -*-

require 'spec_helper'

describe 'GET /' do
  before do
    YAML.stub(:load_file).with("#{CONFIG_ROOT}/graph.yaml").and_return({
      'users' => {'x' => 100, 'y' => 200, 'r' => 5},
      'blogs' => {'x' => 50,  'y' => 50,  'r' => 5}
    })
    get '/'
  end

  subject { last_response }

  specify { subject.ok?.should be_true }
  specify do
    subject.body.should =~ /paper\.circle.*100.*200.*5/
    subject.body.should =~ /paper\.circle.*50.*50.*5/
  end
end

describe 'GET /reload' do
  before do
    tempfile = Tempfile.new('foo')
    tempfile.write '[1, 2, 3]'
    tempfile.close

    Server.class_eval do
      set :target_file, tempfile.path
    end

    get '/reload'
  end

  specify do
    last_response.ok?.should be_true
    last_response.body.should == "[1, 2, 3]"
  end
end
