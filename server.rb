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

  post '/test/:email' do
    puts params[:email]
    # Hmm .create stops executing if .valid? is false
    # Can specify `raise_on_save_failure = false` to change this.
    # User.create(email: params[:email])
    new_user = User.new(email: params[:email])
    new_user.valid? ? new_user.save : 'Error saving email'
  end


end
