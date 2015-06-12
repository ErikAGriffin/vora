require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'
require './custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'


  get '/' do
    # session['user'] ? (render_static 'home.html') : (render 'login')
    render_static 'home.html'
  end

  post '/createuser/:email/:password/:confirmation' do
    if validate_passwords(params[:password],params[:confirmation])
      new_user = create_user(params[:email],params[:password])
      if new_user
        session['user'] = new_user.id
      end
    end
  end

  post '/login/:email/:password' do
    # write a test if the email does not exist in database
    user = User.where('email = ?',params[:email].downcase).first
    if user && user.password == params[:password]
      session['user'] = user.id
      'Logged In'
    else
      'Wrong Password'
    end
  end

  post '/checkemail/:email' do
    # Hmmm should I .downcase the email params upon creation? Or is
    # there some better way of getting case insensitivity?
    user = DB[:users].where('email = ?',params[:email].downcase)
    MultiJson.dump({exists: user.get(:email)})
  end

  get '*' do
    render_static 'home.html'
  end


end
