require 'hobbit'
require 'hobbit/hole'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'

  # DB.create_table?(:songs) do
  #   primary_key :id
  #   String :title
  # end


  get '/' do
    render 'index'
  end



end
