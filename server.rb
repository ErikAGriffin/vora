require 'hobbit'
require 'hobbit/hole'

class Server < Hobbit::Base
  include Hobbit::Hole



    get '/' do
      render 'index'
    end



end
