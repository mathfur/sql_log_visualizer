# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Table do
  before do
    @name = 'users'
    @attrs = {'x' => 100, 'y' => 200, 'r' => 5}
  end

  specify do
    Table.new(@name, @attrs).to_js.should be_equal_ignoring_spaces <<-EOS
      paper.circle(100, 200, 5).attr({'stroke': 'black', 'stroke-width': 2, 'fill': 'white'});
      paper.text(105, 195, 'users');
    EOS
  end
end
