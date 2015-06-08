require 'sequel'

class User < Sequel::Model
  plugin :validation_helpers



  def validate
    super
    validates_presence :email
    # validates_presence [:email, :username]
    validates_unique :email
    validates_format /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :email, message: 'not a valid email'
  end
end
