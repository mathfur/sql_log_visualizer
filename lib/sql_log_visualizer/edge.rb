# -*- encoding: utf-8 -*-

class Edge
  def initialize(tables, edge_begin, edge_end)
    @tables = tables
    @edge_begin = edge_begin
    @edge_end = edge_end

    @x1 = @tables[@edge_begin][:x]
    @y1 = @tables[@edge_begin][:y]
    @x2 = @tables[@edge_end][:x]
    @y2 = @tables[@edge_end][:y]
  end

  def to_html
    [
      "<line x1='#{@x1}' y1='#{@y1}' x2='#{@x2}' y2='#{@y2}' stroke='black' stroke-width='2'/>"
    ].join
  end
end
