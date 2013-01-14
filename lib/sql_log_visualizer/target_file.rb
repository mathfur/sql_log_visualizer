# -*- encoding: utf-8 -*-

class TargetFile
  def initialize(fname)
    @fname = fname
    @pos = 0
  end

  def gets
    lines = []

    f = open(@fname, 'r')
    f.seek(@pos)

    while line = f.gets
      lines << line
    end

    @pos = f.pos
    f.close

    lines.join
  end
end
