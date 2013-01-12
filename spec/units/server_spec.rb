# -*- encoding: utf-8 -*-

require 'spec_helper'

describe 'GET /' do
  before :all do
    get '/'
  end

  subject { last_response }

  specify { subject.ok?.should be_true }
  specify { subject.body.should be_present }
end

describe 'GET /reload' do
  before :all do
    get '/reload'
  end

  subject { last_response }

  specify { subject.ok?.should be_true }
  specify { subject.body.should be_present }
end
