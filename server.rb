require 'hobbit'
require 'hobbit/hole'
require 'sequel'

class Server < Hobbit::Base
  include Hobbit::Hole

  env = ENV['VORA_DB_ENV'] || 'development'
  DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/vora_#{env}")

  DB.create_table?(:songs) do
    primary_key :id
    String :title
  end

  require './lib/model/song'


  get '/' do
    render 'index'
  end



end
