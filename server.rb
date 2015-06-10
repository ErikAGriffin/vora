require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'


  get '/' do
    session['user'] ? (render_static 'home.html') : (render 'login')
  end

  post '/test/:email/:password/:confirmation' do
    'Hmm. Cannot early return?' if params[:password] != params[:confirmation]
    puts params[:email]
    new_user = User.new(email: params[:email], password: params[:password])
    puts 'Checkpoint A!'
    new_user.save if new_user.valid?
    new_user.valid? ? 'User created succesfully' : 'Error Creating User.'
  end


end
