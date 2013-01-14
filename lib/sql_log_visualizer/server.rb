# -*- encoding: utf-8 -*-

class Server < Sinatra::Base
  set :public_folder, "#{BASE_DIR}/public"

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    # modify the following line to straight way
    set :conf, {}
  end

  get '/' do
    graph_conf = YAML.load_file("#{CONFIG_ROOT}/graph.yaml")
    draw_js = graph_conf.map do |table_name, attrs|
      "circles['#{table_name}'] = #{Table.new(table_name, attrs).to_js};"
    end.join("\n")

    <<-EOS
    <html>
      <head>
        <title>SQL LOG VISUALIZER</title>
        <script src='/javascripts/jquery-1.4.2.js' type='text/javascript'></script>
        <script src='/javascripts/raphael.js' type='text/javascript'></script>
        <script src="/javascripts/reload.js" type="text/javascript"></script>
      </head>
      <body>
        <script>
        var paper = Raphael(0, 0, 1000, 1000);
        var circles = {};
        window.onload = function(){
          #{draw_js}
        }
        </script>
      </body>
    </html>
    EOS
  end

  get '/reload' do
    (options.conf[:target_file] ||= TargetFile.new(settings.target_file)).gets
  end
end
