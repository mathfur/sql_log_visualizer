# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Edge do
  before do
    @name = 'users'
    @tables = {
      'users' => {x: 50,  y: 50,  r:5},
      'blogs' => {x: 100, y: 200, r:5}
    }
    @edge_begin = 'users'
    @edge_end = 'blogs'
  end

  specify do
    Edge.new(@tables, @edge_begin, @edge_end).to_html.should be_equal_ignoring_spaces <<-EOS
      <line x1='50' y1='50' x2='100' y2='200' stroke='black' stroke-width='2'/>
    EOS
  end
end

