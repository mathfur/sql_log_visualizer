# -*- encoding: utf-8 -*-

class StatementParser
  def initialize(statement)
    @statement = statement
    case statement[/^([^;]*)/, 1]
    when /SELECT [^ ]+ FROM ([^ ]*)/
      table_names = [$1] + statement.scan(/(?:(?:LEFT|RIGHT|) )?(?:(?:INNER|OUTER) )?JOIN (.*?) ON (?:.*?)/i).flatten
      @result = {:type => :select, :table_names => erase_quotes(table_names)}
    when /INSERT INTO ([^ ]*)/i
      @result = {:type => :insert, :table_names => erase_quotes($1)}
    when /UPDATE ([^ ]*)/i
      @result = {:type => :update, :table_names => erase_quotes($1)}
    else
      raise
    end
  end

  def result
    @result
  end

  def erase_quotes(arr)
    [arr].flatten.compact.map{|e| e.gsub(/['"`\r\n]/, '')}.compact
  end
end
