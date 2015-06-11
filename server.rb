require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'
require './custom-hobbit'
# Wow. My render static only returns the
# given html as a string to whatever asked for it.

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'


  get '/' do
    session['user'] ? (render_static 'home.html') : (render 'login')
  end

  post '/createuser/:email/:password/:confirmation' do
    if validate_passwords(params[:password],params[:confirmation])
      new_user = create_user(params[:email],params[:password])
      if new_user
        session['user'] = new_user.id
        # redirect '/'
        render 'login'
      end
    end
  end

  post '/login/:email/:password' do
    # write a test if the email does not exist in database
    user = DB[:users].where('email = ?',params[:email].downcase)
    if validate_login(user.get(:password_hash),params[:password])
      session['user'] = user.get(:id)
      # redirect '/'
      render 'login'
    else
      'Wrong password.'
    end
  end

  post '/checkemail/:email' do
    # Hmmm should I .downcase the email params upon creation? Or is
    # there some better way of getting case insensitivity?
    user = DB[:users].where('email = ?',params[:email].downcase)
    MultiJson.dump({exists: user.get(:email)})
  end


end
