# -*- encoding: utf-8 -*-

class Table
  def initialize(name, attrs)
    @name = name
    @id = "#{name}_table"
    @attrs = attrs
    @x = attrs['x'].to_i
    @y = attrs['y'].to_i
    @r = attrs['r'].to_i
  end

  def to_html
    [
      "<circle id='#{@id}' cx=#{@x} cy=#{@y}",
      " r=#{@r} stroke='black' stroke-width='2' fill='white'/>",
      "\n",
      "<text x='#{@x+@r}' y='#{@y-@r}'>#{@name}</text>"
    ].join
  end
end
