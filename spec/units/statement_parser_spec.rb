# -*- encoding: utf-8 -*-
require "spec_helper"

describe StatementParser do
  specify do
    StatementParser.new(
      '    (0.6ms)  SELECT "schema_migrations"."version" FROM "schema_migrations"'
    ).result.should == {:type => :select, :table_names => ["schema_migrations"]}
  end

  specify do
    StatementParser.new(
      "SELECT * FROM 'users' INNER JOIN 'blogs' ON 'blogs'.'user_id' = 'users'.'id';"
    ).result.should == {:type => :select, :table_names => ['users', 'blogs']}
  end

  specify do
    StatementParser.new(
      "SELECT * FROM 'users' LEFT OUTER JOIN 'blogs' ON 'blogs'.'user_id' = 'users'.'id';"
    ).result.should == {:type => :select, :table_names => ['users', 'blogs']}
  end

  specify do
    StatementParser.new(<<-EOS).result.should == {:type => :select, :table_names => ['users', 'blogs', 'organizations']}
      SELECT * FROM `users`
      LEFT OUTER JOIN `blogs` ON `blogs`.`user_id` = `users`.`id`
      INNER JOIN `organizations` ON `users`.`organization_id` = `organizations`.`id`
    EOS
  end

  specify do
    StatementParser.new(
      "SELECT * FROM users INNER JOIN blogs ON blogs.user_id = users.id;"
    ).result.should == {:type => :select, :table_names => ['users', 'blogs']}
  end

  specify do
    StatementParser.new(
      "SELECT * FROM users INNER JOIN blogs ON blogs.user_id = users.id;"
    ).result.should == {:type => :select, :table_names => ['users', 'blogs']}
  end

  specify do
    StatementParser.new(
      "    (0.2ms)  INSERT INTO 'schema_migrations' ('version') VALUES ('20121209154448')"
    ).result.should == {:type => :insert, :table_names => ['schema_migrations']}
  end

  specify do
    StatementParser.new(
      "    UPDATE users SET name = 1234 where id = 123;"
    ).result.should == {:type => :update, :table_names => ['users']}
  end
end
