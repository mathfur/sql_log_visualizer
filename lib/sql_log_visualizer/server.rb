class Server < Sinatra::Base
  get '/' do
    graph_conf = YAML.load_file("#{CONFIG_ROOT}/graph.yaml")
    inner_svg = graph_conf.map do |table_name, attrs|
      Table.new(table_name, attrs).to_html
    end.join("\n")

    <<-EOS
    <html>
      <head>
        <title>SQL LOG VISUALIZER</title>
      </head>
      <body>
        <svg width=1000 height=1000>
          #{inner_svg}
        </svg>
      </body>
    </html>
    EOS
  end

  get '/reload' do
    'this is a reload5'
  end
end
