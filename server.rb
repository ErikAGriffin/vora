require 'hobbit'
require 'hobbit/hole'
require 'multi_json'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'

  # DB.create_table?(:songs) do
  #   primary_key :id
  #   String :title
  # end


  get '/' do
    session['user'] ? (render_static 'home.html') : (render 'login')
  end

  post '/test' do
    puts "Posting to /test..."
    sheet = MultiJson.load(request.body, symbolize_keys: true)
    p sheet
    MultiJson.dump(sheet)
  end


end
