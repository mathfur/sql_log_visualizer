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

  def to_js
    [
      "paper.circle(#{@x}, #{@y}, #{@r}).attr({'stroke': 'black', 'stroke-width': 2, 'fill': 'white'});",
      "paper.text(#{@x+@r}, #{@y-@r}, '#{@name}');"
    ].join("\n")
  end
end
