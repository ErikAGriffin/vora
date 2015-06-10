require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'
require './custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'


  get '/' do
    session['user'] ? (render_static 'home.html') : (render 'login')
  end

  post '/createuser/:email/:password/:confirmation' do
    # Is there a point to creating a server side error messaging system,
    # other than for debugging?  The client will have its own validation,
    # and so the server validation is only to protect against malicious
    # users.
    if validate_passwords(params[:password],params[:confirmation])
      new_user = User.new(email: params[:email], password: params[:password])
      if new_user.valid?
        new_user.save
        session['user'] = new_user.id
        'User created successfully'
      else
        'Error creating user'
      end
    else
      'Password did not meet requirements.'
    end
  end


end
