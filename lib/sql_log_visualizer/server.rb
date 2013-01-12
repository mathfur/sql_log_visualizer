class Server < Sinatra::Base
  get '/' do
    'this is a index5'
  end

  get '/reload' do
    'this is a reload5'
  end
end
