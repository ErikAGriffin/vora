require 'sequel'

class User < Sequel::Model
  include BCrypt
  plugin :validation_helpers

  # Hmm this does not seem to be necessary / used,
  # as I am not getting a User object back but a
  # hash of the values...
  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def validate
    super
    validates_presence [:email, :password_hash]
    validates_unique :email
    validates_format /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :email, message: 'not a valid email'
  end
end
