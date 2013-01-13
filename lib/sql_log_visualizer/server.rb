# -*- encoding: utf-8 -*-

class Server < Sinatra::Base
  set :public_folder, "#{BASE_DIR}/public"

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    graph_conf = YAML.load_file("#{CONFIG_ROOT}/graph.yaml")
    draw_js = graph_conf.map do |table_name, attrs|
      Table.new(table_name, attrs).to_js
    end.join("\n")

    <<-EOS
    <html>
      <head>
        <title>SQL LOG VISUALIZER</title>
        <script src='/js/raphael.js' type='text/javascript'></script>
      </head>
      <body>
        <script>
        window.onload = function(){
          var paper = Raphael(0, 0, 1000, 1000);
          #{draw_js}
        }
        </script>
      </body>
    </html>
    EOS
  end

  get '/reload' do
    'this is a reload5'
  end
end
