# -*- encoding: utf-8 -*-

require 'spec_helper'

describe 'GET /' do
  before do
    YAML.stub(:load_file).with("#{CONFIG_ROOT}/graph.yaml").and_return({
      'users' => {:x => 100, :y => 200, :r => 5},
      'blogs' => {:x => 50,  :y => 50,  :r => 5}
    })
    get '/'
  end

  subject { last_response }

  specify { subject.ok?.should be_true }
  specify do
    subject.body.should have_tag("svg circle[cx='100'][cy='200'][r='5']")
    subject.body.should have_tag("svg circle[cx='50'][cy='50'][r='5']")
  end
end

describe 'GET /reload' do
  before :all do
    get '/reload'
  end

  subject { last_response }

  specify { subject.ok?.should be_true }
  specify { subject.body.should be_present }
end
