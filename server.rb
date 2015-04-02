require 'hobbit'
require 'hobbit/hole'
require 'sequel'

class Server < Hobbit::Base
  include Hobbit::Hole

  env = ENV['VORA_DB_ENV'] || 'development'

  DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/vora_#{env}")





    get '/' do
      render 'index'
    end



end
