# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Table do
  before do
    @name = 'users'
    @attrs = {x: 100, y: 200, r:5}
  end

  specify do
    Table.new(@name, @attrs).to_html.should be_equal_ignoring_spaces <<-EOS
      <circle id='users_table' cx='100' cy='200' r='5' stroke='black' stroke-width='2' fill='white'>
      <text x='105' y='205'>users</text>
    EOS
  end
end
