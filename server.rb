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
    if validate_passwords(params[:password],params[:confirmation])
      new_user = User.new(email: params[:email], password: params[:password])
      if new_user.valid?
        new_user.save
        session['user'] = new_user.id
        render_static 'home.html'
      end
    end
    'no message.'
  end

  post '/checkemail/:email' do
    # Hmmm should I .downcase the email params upon creation? Or is
    # there some better way of getting case insensitivity?
    user = DB[:users].where('email = ?',params[:email].downcase)
    MultiJson.dump({exists: user.get(:email)})
  end


end
